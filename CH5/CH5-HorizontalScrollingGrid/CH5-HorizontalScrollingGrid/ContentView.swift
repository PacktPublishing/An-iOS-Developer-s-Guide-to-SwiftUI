//
//  ContentView.swift
//  CH5-HorizontalScrollingGrid
//
//  Created by Michele Fadda on 26/01/2023.
//

import SwiftUI

import SwiftUI

// An array of 15 system images
let imageNames = ["pencil", "square", "circle", "triangle", "star", "arrow.up", "arrow.down", "arrow.left", "arrow.right", "arrow.turn.up", "arrow.turn.down", "arrow.turn.left", "arrow.turn.right", "arrow.up.arrow.down", "arrow.left.arrow.right"]

// Create an array of 150 random square images
let items: [Image] = (1...150).map { _ in
Image(systemName: imageNames.randomElement()!)
}

struct ContentView: View {

    var body: some View {
        ScrollView(.horizontal) {
            Grid(items) { item in
                item
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
            }.gridStyle(
                .fixed(size: CGSize(width: 100, height: 100))
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
