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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 0)]) {
            AsyncImage(
                url: URL(string: imageUrl ?? imagePlaceholder)!,
                content: {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                },
                placeholder: {
                    SkeletonImageView()
                }
            )
            
            VStack(alignment: .leading) {
                Text(title ?? "Title")
                    .font(.headline)
                    .lineLimit(3)

                HStack(alignment: .bottom, spacing: 8) {
                    Text(author ?? "Author. F")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)

                    Text(date ?? "2012-12-12")
                        .font(.caption)
                }
                    .foregroundColor(.gray)
                        .padding(.top, 4)
                    }
                    .foregroundColor(.primary)
            }
                .padding(20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
}
