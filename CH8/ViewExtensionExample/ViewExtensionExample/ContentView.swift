//
//  ContentView.swift
//  ViewExtensionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

import SwiftUI

struct CardStyling: ViewModifier {
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

extension View {
    func cardStyling(backgroundColor: Color) -> some View {
        self.modifier(CardStyling(backgroundColor: backgroundColor))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Blue card!")
                .cardStyling(backgroundColor: .blue)
            Text("White card")
                .cardStyling(backgroundColor: .white)
            Text("Green card")
                .cardStyling(backgroundColor: .green)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
