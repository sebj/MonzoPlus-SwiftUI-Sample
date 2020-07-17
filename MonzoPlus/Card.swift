
//  Card.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct Card: View {
    let colors: [Color]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing))
            .frame(width: 292, height: 184)
            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Preview

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(colors: [Color.red, Color.orange])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
