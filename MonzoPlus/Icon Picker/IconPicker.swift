
//  IconPicker.swift
//  Created by Seb Jachec on 17/07/2020.

import SwiftUI

struct IconPicker: View {
    
    let colors: [Color]
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    @State
    private var scrollOffsetX: CGFloat = 0
    
    var body: some View {
        ZStack {
            ColorOrb(colors: colors, strokeWidth: Constants.orbStrokeWidth)
                .frame(width: Constants.orbSize, height: Constants.orbSize)
            
            ZStack {
                Color.white
                
                ZStack {
                    Color.white
                    
                    Circle()
                        .fill(Color.black)
                        .frame(
                            width: Constants.orbSize + Constants.orbStrokeWidth,
                            height: Constants.orbSize + Constants.orbStrokeWidth)
                        .offset(x: -scrollOffsetX, y: 0)
                }
                .compositingGroup()
                .luminanceToAlpha()
                .opacity(colorScheme == .dark ? 0.6 : 0.3)
            }
            .mask(
                IconsBar(iconNames: Constants.iconNames, size: Constants.iconSize)
            )
            .draggable(xOffset: $scrollOffsetX)
        }
        .frame(
            width: CGFloat(Constants.iconNames.count) * Constants.iconSize,
            height: Constants.orbSize)
    }
    
    private struct Constants {
        static let iconNames = [
            "envelope.open.fill",
            "scribble",
            "circles.hexagongrid.fill",
            "waveform",
            "square.stack.3d.up.fill",
            "circle.circle.fill",
            "paintpalette.fill",
            "star.fill",
            "text.justify"
        ]
        
        static let iconSize: CGFloat = 56
        static let iconForegroundColor = Color.red
        static let orbSize: CGFloat = 56
        static let orbStrokeWidth: CGFloat = 2
    }
}

// MARK: - Preview

struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        IconPicker(colors: [Color.red, Color.orange])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

