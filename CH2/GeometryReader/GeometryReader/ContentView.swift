//
//  ContentView.swift
//  GeometryReader
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:20) {
                Text("Horizontal size: \(geometry.size.width)")
                Text("Vertical size: \(geometry.size.height)")

            }
                .padding()
                .border(Color.blue,width: 1)
        }
    }
}


#Preview {
    ContentView()
}
