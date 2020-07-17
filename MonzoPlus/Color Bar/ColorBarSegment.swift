
//  ColorBarSegment.swift
//  Created by Seb Jachec on 17/07/2020.

import SwiftUI

struct ColorBarSegment: View {
    let item: ColorItem
    let width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(
                    gradient: Gradient(colors: [item.startColor, item.endColor]),
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing))
            .frame(width: width)
    }
}

// MARK: - Preview

struct ColorBarSegment_Previews: PreviewProvider {
    static var previews: some View {
        ColorBarSegment(
            item: .init(startColor: Color.red, endColor: Color.blue),
            width: 72)
            .frame(height: 16)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
