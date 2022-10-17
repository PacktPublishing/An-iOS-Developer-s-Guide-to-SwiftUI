//
//  ContentView.swift
//  Ch1CreatingMultiplePreviewsExample
//
//  Created by Michele Fadda on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            .previewDisplayName("iphone 11")

    }
}
