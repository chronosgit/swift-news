//
//  NewsModel.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import Foundation

class NewsModel: ObservableObject {
    @Published var allNews = true
    @Published var articles: [Article] = []
    
    var timer: Timer? = nil
    @Published var isFetchRequestActive = false
    
    var totalPagesAmount: Int = 0
    let pageSize = 10
    @Published var currentPage = 1
    
    init() {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCallback() {
        if(isFetchRequestActive) {
            return
        }
        
        Task {
            await updateTopNews()
            
            isFetchRequestActive = false
        }
    }
    
    @objc func updateTopNews() async {
        if isFetchRequestActive {
            return
        }
        
        isFetchRequestActive = true
        
        do {
            let responseData = try await getTopNews()
            
            articles = responseData.articles
            totalPagesAmount = responseData.totalResults
            
            isFetchRequestActive = false
        } catch APIError.invalidURL {
            print("Invalid URL")
        } catch APIError.invalidResponse {
            print("Invalid API call response")
        } catch APIError.invalidData {
            print("Invalid data returned in API call response")
        } catch {
            print(String(describing: error))
            print("Unexpected error during updating top news has occured")
        }
    }
    
    
    
    func getTopNews() async throws -> JSONAPIResponse {
        let apiKey = "11d441332483476f8871028f223af4da"
        let baseUrl = "https://newsapi.org/v2/"
        let country = "us"
        let endpoint = "\(baseUrl)top-headlines?country=\(country)&pageSize=\(pageSize)&page=\(currentPage)&apiKey=\(apiKey)"
        
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
            
            return try decoder.decode(JSONAPIResponse.self, from: data)
        } catch {
            print(String(describing: error))
            
            throw APIError.invalidData
        }
    }
    
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
    
    func goToNextPage() {
        if((pageSize * currentPage) <= (totalPagesAmount)) {
            articles = []
            
            currentPage += 1
            
            // FIXME: - Active API calls are not cancelled
            isFetchRequestActive = false
            
            Task {
                await updateTopNews()
            }
        }
    }
    
    func goToPrevPage() {
        if(currentPage > 1) {
            articles = []
            
            currentPage -= 1
            
            // FIXME: - Active API calls are not cancelled
            isFetchRequestActive = false
            
            Task {
                await updateTopNews()
            }
        }
    }
    
    struct JSONAPIResponse: Codable {
        var status: String
        var articles: [Article]
        var totalResults: Int
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
