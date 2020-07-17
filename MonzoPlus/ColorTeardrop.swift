
//  ColorTeardrop.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct ColorTeardrop: View {
    let colors: [Color]
    
    var body: some View {
        Teardrop()
            .fill(LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .leading,
                    endPoint: .trailing))
            .overlay(
                Teardrop()
                    .stroke(Color.white, lineWidth: 2)
            )
            .offset(x: 0, y: -4)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
            .frame(width: 38, height: 38)
    }
}
