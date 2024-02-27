//
//  SkeletonImageView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct SkeletonImageView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("secondBgColor"))
            
            Image("imagePlaceholder")
                .resizable()
                .foregroundColor(.white)
                .font(.title)
        }
    }
}
