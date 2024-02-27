//
//  TopArticlesListView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TopArticlesListView: View {
    typealias Article = NewsModel.Article
    
    var articles: [Article]
    
    var body: some View {
        ScrollView {
            ForEach(articles) {a in
                TopArticleView(
                    imageUrl: a.imageUrl,
                    title: a.title,
                    date: a.date,
                    author: a.author
                )
            }
        }
    }
}
