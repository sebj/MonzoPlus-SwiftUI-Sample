
//  ColorItem.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct ColorItem: Hashable, Equatable, Identifiable {
    let id = UUID()
    let startColor: Color
    let endColor: Color
}

extension ColorItem {
    static func generateRainbow() -> [ColorItem] {
        zip(Color.rainbowPalette, Color.rainbowPalette.dropFirst()).map {
            ColorItem(startColor: $0.0, endColor: $0.1)
        }
    }
}
