
//  ScrollViewXOffsetPreferenceKey.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct ScrollViewXOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
