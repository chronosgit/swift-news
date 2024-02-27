//
//  TabView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct TabView: View {
    var onClick: (String) -> ()
    
    var body: some View {
        HStack {
            Spacer()
            
            TabButtonView(
                title: "All",
                imageName: "globe.europe.africa.fill",
                onClick: self.onClick
            )
            
            Spacer()
            
            TabButtonView(
                title: "Top",
                imageName: "person.2.wave.2.fill",
                onClick: self.onClick
            )
            
            Spacer()
        }
            .padding(.top, 15)
            .background(Color("secondBgColor"))
            .font(.system(size: 24, weight: .semibold))
            .foregroundColor(Color("tabColor"))
    }
}
