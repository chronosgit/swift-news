//
//  NewsModel.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import Foundation

struct NewsModel {
    private(set) var allNews: Bool
    private(set) var articles: [Article]
    
    mutating func chooseNews(type: String) {
        switch type {
        case "All":
            print("toALL")
            allNews = true
            print(allNews, "\n")
            break
        case "Top":
            print("toTOP")
            allNews = false
            print(allNews, "\n")
            break
        default:
            print("Error when choosing news type")
            break
        }
    }
    
    init(articles: [Article], allNews: Bool) {
        self.articles = articles
        self.allNews = allNews
    }
    
    struct Article: Identifiable {
        var imageUrl: URL
        var title: String
        var date: String
        var author: String
        var id: String
    }
}
