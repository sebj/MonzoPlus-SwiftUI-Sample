
//  Teardrop.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct Teardrop: Shape {
    func path(in rect: CGRect) -> Path {
        let halfWidth = (rect.midX - rect.minX)
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control1: CGPoint(
                x: rect.minX - (halfWidth * 0.4),
                y: rect.maxY),
            control2: CGPoint(
                x: rect.minX + (halfWidth * 0.7),
                y: rect.minY))
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control1: CGPoint(
                x: rect.maxX - (halfWidth * 0.7),
                y: rect.minY),
            control2: CGPoint(
                x: rect.maxX + (halfWidth * 0.4),
                y: rect.maxY))
        return path
    }
}

// MARK: - Preview

struct Teardrop_Previews: PreviewProvider {
    static var previews: some View {
        Teardrop()
            .fill(Color.black)
            .padding()
            .previewLayout(.fixed(width: 96, height: 96))
    }
}
