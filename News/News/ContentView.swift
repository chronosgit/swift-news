//
//  ContentView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    typealias Article = NewsModel.Article
    
    @ObservedObject var newsModel: NewsModel
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea() // background changer
            
            VStack {
                if newsModel.allNews {
                    TopArticlesListView(
                        newsModel: newsModel,
                        articles: newsModel.articles
                    )
                        .task {
                            await newsModel.updateNews()
                        }
                } else {
                    TopArticlesListView(
                        newsModel: newsModel, 
                        articles: newsModel.articles
                    )
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    PaginationButtonsView(newsModel: newsModel)
                    
                    TabView(areAllNews: newsModel.allNews, onClick: newsModel.chooseNews)
                }
            }
        }
            .foregroundColor(.accentColor)

    }
}

#Preview {
    ContentView(newsModel: NewsModel()) // allowable
}
