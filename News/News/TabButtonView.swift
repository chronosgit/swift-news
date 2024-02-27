//
//  TabButtonView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TabButtonView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Image(systemName: imageName)
            
            Button(title) {}
        }
    }
}

#Preview {
    TabButtonView(title: "All", imageName: "globe.europe.africa.fill")
}
