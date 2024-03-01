//
//  TopArticlesListView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TopArticlesListView: View {
    typealias Article = NewsModel.Article
    
    @ObservedObject var newsModel: NewsModel
    
    var articles: [Article]
    
    var body: some View {
        if articles.count == 0 && newsModel.isFetchRequestActive {
            ProgressView()
                .foregroundColor(.primary)
                .font(.system(size: 24, weight: .semibold))
                .padding()
        } else {
            ScrollView {
                ForEach(0..<articles.count, id: \.self) {
                    let a = articles[$0]
                    
                    TopArticleView(
                        imageUrl: a.urlToImage,
                        title: a.title,
                        date: a.publishedAt,
                        author: a.author
                    )
                }
            }
                .padding()
        }
    }
}
