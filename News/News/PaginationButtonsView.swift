//
//  PaginationButtonsView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 28.02.2024.
//

import SwiftUI

struct PaginationButtonsView: View {
    @ObservedObject var newsModel: NewsModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                PaginationButton(
                    title: "Previous page",
                    imageName: "arrowshape.backward.fill",
                    type: "prev",
                    onClick: newsModel.goToPrevPage
                )
                
                Spacer()
                
                Text(String(newsModel.currentPage))
                
                Spacer()
                
                PaginationButton(
                    title: "Next page",
                    imageName: "arrowshape.forward.fill",
                    type: "next",
                    onClick: newsModel.goToNextPage
                )
            }
                .padding()
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color("tabColor"))
                .background(Color("secondBgColor"))
            
            Divider()
                .frame(height: 1)
                .background(.secondary)
        }
    }
    
    struct PaginationButton: View {
        var title: String
        var imageName: String
        var type: String = "prev"
        var onClick: () -> ()
        
        var body: some View {
            Button(
                action: {
                    onClick()
                },
                label: {
                    HStack {
                        if type == "prev" {
                            Image(systemName: imageName)
                            Text(title)
                        } else {
                            Text(title)
                            Image(systemName: imageName)
                        }
                    }
                }
            )
        }
    }
}
