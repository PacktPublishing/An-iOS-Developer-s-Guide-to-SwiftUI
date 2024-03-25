//
//  ContentView.swift
//  DividerExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                Divider()
                Text("First Label")
                Divider()
                Spacer()
                Divider()
                Text("Second Label")
                Divider()
            }
    }
}

#Preview {
    ContentView()
}
