//
//  NewsApp.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject var newsApp = NewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(newsViewModel: newsApp)
        }
    }
}
