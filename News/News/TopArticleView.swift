//
//  TopArticleView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TopArticleView: View {
    var imageUrl: URL
    var title: String
    var date: String
    var author: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(
                    url: imageUrl,
                    content: {image in
                        image
                            .resizable()
                    },
                    placeholder: {
                        SkeletonImageView()
                    }
                )
                    .clipShape(Capsule())
                    .frame(maxWidth: 150, maxHeight: 150)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(author)
                            .bold()
                        
                        Text(date)
                    }
                }
            }
                .padding()
                .foregroundColor(.primary)
        }
    }
}
