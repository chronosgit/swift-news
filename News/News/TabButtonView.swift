//
//  TabButtonView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TabButtonView: View {
    @StateObject private var newsViewModel = NewsViewModel()
    
    var title: String
    var imageName: String
    
    var body: some View {
        Button(
            action: {
                newsViewModel.chooseNews(type: title)
            },
            label: {
                VStack(alignment: .center, spacing: 6) {
                    Image(systemName: imageName)
                    Text(title)
                }
            }
        )
    }
}
