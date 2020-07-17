
//  ColorBarModel.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

final class ColorBarModel: ObservableObject {
    @Published
    private(set) var items: [ColorItem]
    
    private var lastItemId: ColorItem.ID
    
    init() {
        let items = ColorItem.generateRainbow()
        self.items = items
        lastItemId = items.last!.id
    }
    
    func itemAppeared(_ item: ColorItem) {
        guard item.id == lastItemId else {
            return
        }
        
        let newItems = ColorItem.generateRainbow()
        lastItemId = newItems.last!.id
        items.append(contentsOf: newItems)
    }
    
    func scrollOffsetChanged(
        xOffset: CGFloat,
        segmentWidth: CGFloat,
        colors: Binding<[Color]>)
    {
        let leadingIndex = Int(floor(abs((xOffset - 14) / (segmentWidth + 2))))
        let middleIndex = leadingIndex + 3
        
        let rainbowCount = Color.rainbowPalette.count
        let rainbowStartIndex = middleIndex % (rainbowCount - 1)
        let rainbowEndIndex = (rainbowStartIndex + 1) % (rainbowCount - 1)
        
        colors.wrappedValue = [Color.rainbowPalette[rainbowStartIndex], Color.rainbowPalette[rainbowEndIndex]]
    }
}
