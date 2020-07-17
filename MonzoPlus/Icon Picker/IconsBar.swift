
//  IconsBar.swift
//  Created by Seb Jachec on 17/07/2020.

import SwiftUI

struct IconsBar: View {
    
    let iconNames: [String]
    let size: CGFloat
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(iconNames, id: \.self) {
                Image(systemName: $0)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: size))
            }
        }
        .frame(width: CGFloat(iconNames.count) * size)
    }
}

// MARK: - Preview

struct IconsBar_Previews: PreviewProvider {
    static var previews: some View {
        IconsBar(iconNames: ["heart.fill", "star.fill"], size: 48)
            .frame(height: 48)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

