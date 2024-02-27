//
//  ContentView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea() // background changer
                
                TopArticlesView()
            }
            .foregroundColor(.accentColor)

        }
}

#Preview {
    ContentView()
}
