//
//  NewsModel.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import Foundation

class NewsModel: ObservableObject {
    @Published var allNews: Bool = true
    @Published var articles: [Article] = []
    
    var timer: Timer? = nil
    
//    init() {
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateTopNews), userInfo: nil, repeats: true)
//    }
    
    func chooseNews(type: String) {
        switch type {
            case "All":
                allNews = true
                break
            case "Top":
                allNews = false
                break
            default:
                print("Error when choosing news type")
                break
        }
    }
    
    @objc func updateTopNews() async {
        do {
            let responseData = try await getTopNews()
            
            articles = responseData.articles
        } catch APIError.invalidURL {
            print("Invalid URL")
        } catch APIError.invalidResponse {
            print("Invalid API call response")
        } catch APIError.invalidData {
            print("Invalid data returned in API call response")
        } catch {
            print("Unexpected error during updating top news has occured")
        }
    }
    
    func getTopNews() async throws -> JSONArray {
        let apiKey = "11d441332483476f8871028f223af4da"
        let baseUrl = "https://newsapi.org/v2/"
        let country = "us"
        let endpoint = "\(baseUrl)top-headlines?country=\(country)&apiKey=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // just in case
            
            // FIXME: - some error here occurs a lot, be careful with data types
            return try decoder.decode(JSONArray.self, from: data)
        } catch {
            print(String(describing: error))
            
            throw APIError.invalidData
        }
    }
    
    struct JSONArray: Codable {
        var articles: [Article]
    }
    
    struct Article: Codable {
        var source: ArticleAPISource?
        var urlToImage: String?
        var url: String?
        var title: String?
        var content: String?
        var description: String?
        var publishedAt: String?
        var author: String?
    }
    
    struct ArticleAPISource: Codable {
        var id: String?
        var name: String?
    }
    
    enum APIError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
    }
}


// MARK: - Dummy Articles
/*
 
 [
     Article(
         urlToImage: URL(string: "https://placekitten.com/1920/1080")!,
         title: "Animals get boost from Stuihghwgrh free camps",
         publishedAt: "2024-02-27T12:05:00Z",
         author: "Joseph Adinolfi"
     ),
     Article(
         urlToImage: URL(string: "https://placekitten.com/1920/1080")!,
         title: "Animals get boost from Stuihghwgrh free camps",
         publishedAt: "2024-02-27T12:05:00Z",
         author: "Joseph Adinolfi"
     ),
     Article(
         urlToImage: URL(string: "https://placekitten.com/1920/1080")!,
         title: "Animals get boost from Stuihghwgrh free camps",
         publishedAt: "2024-02-27T12:05:00Z",
         author: "Joseph Adinolfi"
     ),
     Article(
         urlToImage: URL(string: "https://placekitten.com/1920/1080")!,
         title: "Animals get boost from Stuihghwgrh free camps",
         publishedAt: "2024-02-27T12:05:00Z",
         author: "Joseph Adinolfi"
     ),
     Article(
         urlToImage: URL(string: "https://placekitten.com/1920/1080")!,
         title: "Animals get boost from Stuihghwgrh free camps",
         publishedAt: "2024-02-27T12:05:00Z",
         author: "Joseph Adinolfi"
     )
]
 
*/


// MARK: - API Response example
/*
 
 {
 -"source": {
 "id": null,
 "name": "CNBC"
 },
 "author": "Alex Harring",
 "title": "Stocks are little changed Tuesday as traders assess fresh earnings and new data: Live updates - CNBC",
 "description": "Stocks were flat Tuesday as the market rally took another breather, with investors looking ahead to key data slated for release later this week.",
 "url": "https://www.cnbc.com/2024/02/26/stock-market-today-live-updates.html",
 "urlToImage": "https://image.cnbcfm.com/api/v1/image/107373645-17079283732024-02-14t161110z_791716537_rc2e26a80ifn_rtrmadp_0_usa-stocks.jpeg?v=1707928479&w=1920&h=1080",
 "publishedAt": "2024-02-27T14:42:00Z",
 "content": "Stocks were flat Tuesday as the market rally took another breather, with investors looking ahead to key data slated for release later this week.\r\nThe S&amp;P 500 inched down 0.05%, while the Dow Jone… [+1577 chars]"
 },
*/
