//
//  ContentView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    var all: Bool = false
    
    var body: some View {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea() // background changer
                
                VStack {
                    if all {
                        // TODO: - all news view
                    } else {
                        TopArticlesView()
                    }
                    
                    Spacer()
                    
                    TabView()
                }
            }
            .foregroundColor(.accentColor)

        }
}

#Preview {
    ContentView()
}
