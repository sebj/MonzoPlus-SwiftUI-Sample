
//  ColorOrb.swift
//  Created by Seb Jachec on 17/07/2020.

import SwiftUI

struct ColorOrb: View {
    
    let colors: [Color]
    let strokeWidth: CGFloat
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing))
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: strokeWidth)
            )
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 1)
    }
}

// MARK: - Preview

struct ColorOrb_Previews: PreviewProvider {
    static var previews: some View {
        ColorOrb(
            colors: [Color.red, Color.orange],
            strokeWidth: 2)
            .padding()
            .previewLayout(.fixed(width: 96, height: 96))
    }
}

