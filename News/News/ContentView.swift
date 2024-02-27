//
//  ContentView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea() // background changer
            
            VStack {
                if newsViewModel.allNews {
                    // TODO: - all news view
                    Text("All news")
                } else {
                    TopArticlesListView(articles: newsViewModel.articles)
                }
                
                Spacer()
                
                TabView()
            }
        }
            .foregroundColor(.accentColor)

    }
}

#Preview {
    ContentView(newsViewModel: NewsViewModel()) // allowable
}
