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
    var onClick: (String) -> ()
    
    var body: some View {
        Button(
            action: {
                onClick(title)
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
