
//  ColorBar.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct ColorBar: View {
    
    let colors: Binding<[Color]>
    
    @StateObject
    private var model = ColorBarModel()
    
    private let coordinateSpace = "scroll"
    private let segmentWidth: CGFloat = 56
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scroll in
                ZStack {
                    LazyHStack(spacing: 0) {
                        ForEach(model.items.indexed(), id: \.1.id) { (index, item) in
                            ColorBarSegment(
                                item: item,
                                width: segmentWidth)
                                .padding(.leading, index == 0 ? -14 : 1)
                                .padding(.trailing, 1)
                                .id(item)
                                .onTapGesture {
                                    // TODO: Not working
                                    scroll.scrollTo(item)
                                }
                                .onAppear {
                                    model.itemAppeared(item)
                                }
                        }
                    }
                    
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .named(coordinateSpace)).minX
                        Color.clear.preference(key: ScrollViewXOffsetPreferenceKey.self, value: offset)
                    }
                }
                .frame(height: 14)
                .padding(.vertical)
            }
        }
        .coordinateSpace(name: coordinateSpace)
        .onPreferenceChange(ScrollViewXOffsetPreferenceKey.self) { value in
            model.scrollOffsetChanged(
                xOffset: value,
                segmentWidth: segmentWidth,
                colors: colors)
        }
    }
}

// MARK: - Preview

struct ColorBar_Previews: PreviewProvider {
    static var previews: some View {
        ColorBar(colors: .constant([Color.red, Color.orange]))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

