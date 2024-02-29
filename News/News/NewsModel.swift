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
            await updateNews()
            
            isFetchRequestActive = false
        }
    }
    
    @objc func updateNews() async {
        if isFetchRequestActive {
            return
        }
        
        isFetchRequestActive = true
        
        do {
            let responseData = try await getNews()
            
            articles = responseData.articles
            totalPagesAmount = responseData.totalResults
            
            isFetchRequestActive = false
        } catch APIError.invalidURL {
            print("Invalid URL")
            isFetchRequestActive = false
        } catch APIError.invalidResponse {
            print("Invalid API call response")
            isFetchRequestActive = false
        } catch APIError.invalidData {
            print("Invalid data returned in API call response")
            isFetchRequestActive = false
        } catch {
            print(String(describing: error))
            print("Unexpected error during updating top news has occured")
            isFetchRequestActive = false
        }
    }
    
    
    
    func getNews() async throws -> JSONAPIResponse {
        // MARK: verify apiKey
        let apiKey = "11d441332483476f8871028f223af4da"
        let baseUrl = "https://newsapi.org/v2/"
        let country = "us"
        
        var endpoint = ""
        if allNews {
            endpoint = "\(baseUrl)everything?pageSize=\(pageSize)&page=\(currentPage)&sortBy=relevancy&apiKey=\(apiKey)"
        } else {
            endpoint = "\(baseUrl)top-headlines?country=\(country)&pageSize=\(pageSize)&page=\(currentPage)&apiKey=\(apiKey)"
        }
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // MARK: -  May return 429 error due to free api subscription limitation
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
        var hasTypeChanged = false
        
        switch type {
            case "All":
                if(!allNews) {
                    hasTypeChanged.toggle()
                }
                allNews = true
                break
            case "Top":
                if(allNews) {
                    hasTypeChanged.toggle()
                }
                allNews = false
                break
            default:
                print("Error when choosing news type")
                break
        }
        
        if hasTypeChanged {
            articles = []
            currentPage = 1
            
            Task {
                await updateNews()
            }
        }
    }
    
    func goToNextPage() {
        if((pageSize * currentPage) <= (totalPagesAmount)) {
            articles = []
            
            currentPage += 1
            
            // TODO: - Active API calls are not cancelled
            isFetchRequestActive = false
            
            Task {
                await updateNews()
            }
        }
    }
    
    func goToPrevPage() {
        if(currentPage > 1) {
            articles = []
            
            currentPage -= 1
            
            // TODO: - Active API calls are not cancelled
            isFetchRequestActive = false
            
            Task {
                await updateNews()
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
