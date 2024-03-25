//
//  ContentView.swift
//  CardStyleViewModifierExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct CardStyle: ViewModifier {
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 2)
            )
            .background(backgroundColor)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Text("Blue card!")
                .modifier(CardStyle(backgroundColor: .blue))
            Text("White card")
                .modifier(CardStyle(backgroundColor: .white))
            Text("Green card")
                .modifier(CardStyle(backgroundColor: .green))
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
