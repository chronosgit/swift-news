//
//  TopArticlesView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct Article: Identifiable {
    var imageUrl: URL
    var title: String
    var date: String
    var author: String
    var id: String
}

struct TopArticlesView: View {
    var articles: [Article] = [
        Article(
            imageUrl: URL(string: "https://placekitten.com/1920/1080")!,
            title: "Animals get boost from Stuihghwgrh free camps",
            date: "2024-02-27T12:05:00Z",
            author: "Joseph Adinolfi",
            id: "1"
        ),
        Article(
            imageUrl: URL(string: "https://placekitten.com/1920/1080")!,
            title: "Animals get boost from Stuihghwgrh free camps",
            date: "2024-02-27T12:05:00Z",
            author: "Joseph Adinolfi",
            id: "2"
        ),
        Article(
            imageUrl: URL(string: "https://placekitten.com/1920/1080")!,
            title: "Animals get boost from Stuihghwgrh free camps",
            date: "2024-02-27T12:05:00Z",
            author: "Joseph Adinolfi",
            id: "3"
        ),
        Article(
            imageUrl: URL(string: "https://placekitten.com/1920/1080")!,
            title: "Animals get boost from Stuihghwgrh free camps",
            date: "2024-02-27T12:05:00Z",
            author: "Joseph Adinolfi",
            id: "4"
        ),
        Article(
            imageUrl: URL(string: "https://placekitten.com/1920/1080")!,
            title: "Animals get boost from Stuihghwgrh free camps",
            date: "2024-02-27T12:05:00Z",
            author: "Joseph Adinolfi",
            id: "5"
        )
    ]
    
    var body: some View {
        VStack {
            TopArticlesListView(articles: articles)
            
            Spacer()
            
            TabView()
        }
    }
}
