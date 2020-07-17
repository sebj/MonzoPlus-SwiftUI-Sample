
//  ContentView.swift
//  Created by Seb Jachec on 16/07/2020.

import SwiftUI

struct ContentView: View {
    
    @State
    var colors = [Color]()
    
    var body: some View {
        VStack {
            Card(colors: colors)
                .padding(.top, 64)
            
            IconPicker(colors: colors)
                .padding(.top, 32)
            
            ZStack {
                ColorBar(colors: $colors)
                
                ColorTeardrop(colors: colors)
            }
            .padding(.top, 26)
            
            Spacer()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
