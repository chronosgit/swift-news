//
//  TopArticleView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TopArticleView: View {
    var imageUrl: String?
    var title: String?
    var date: String?
    var author: String?
    
    var imagePlaceholder = "https://www.svgrepo.com/show/508699/landscape-placeholder.svg"
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(
                    url: URL(string: imageUrl ?? imagePlaceholder)!,
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
                    Text(title ?? "Title")
                        .font(.system(size: 20, weight: .bold))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(author ?? "Author. F")
                            .bold()
                        
                        Text(date ?? "2012-12-12")
                    }
                }
            }
                .padding()
                .foregroundColor(.primary)
        }
    }
}
