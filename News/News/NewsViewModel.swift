//
//  NewsViewModel.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    typealias Article = NewsModel.Article
    
    private static var articles: [Article] = [
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
    
    @Published private var newsModel = NewsModel(articles: articles, allNews: true)
    
    var allNews: Bool {
        newsModel.allNews
    }
    
    var articles: [Article] {
        newsModel.articles
    }
    
    func chooseNews(type: String) {
        newsModel.chooseNews(type: type)
    }
}
