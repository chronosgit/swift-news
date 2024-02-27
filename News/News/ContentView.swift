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
                    // TODO: - all news view
                    Text("All news")
                } else {
                    TopArticlesListView(articles: newsModel.articles)
//                        .task {
//                            print("Fetch on load")
//                            await newsModel.updateTopNews()
//                        }
                        .task {
                            await newsModel.updateTopNews()
                        }
                }
                
                Spacer()
                
                TabView(areAllNews: newsModel.allNews, onClick: newsModel.chooseNews)
            }
        }
            .foregroundColor(.accentColor)

    }
}

#Preview {
    ContentView(newsModel: NewsModel()) // allowable
}
