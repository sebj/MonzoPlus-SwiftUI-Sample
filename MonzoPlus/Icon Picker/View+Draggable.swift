
//  View+Draggable.swift
//  Created by Seb Jachec on 17/07/2020.

import SwiftUI

private struct DraggableView: ViewModifier {
    
    let xOffset: Binding<CGFloat>
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        xOffset.wrappedValue += value.location.x - value.startLocation.x
                    }
            )
            .offset(x: xOffset.wrappedValue, y: 0)
    }
}

// MARK: -

extension View {
    func draggable(xOffset: Binding<CGFloat>) -> some View {
        modifier(DraggableView(xOffset: xOffset))
    }
}
