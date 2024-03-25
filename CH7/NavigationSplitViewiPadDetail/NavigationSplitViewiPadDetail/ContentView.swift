//
//  ContentView.swift
//  NavigationSplitViewiPadDetail
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List(1..<20) { i in
                NavigationLink("Row \(i)", value: i)
            }
            .navigationDestination(for: Int.self) {
                Text("You have selected row #\($0)")
                    .font(.title)
            }
            .navigationTitle("NavigationSplitView")
        } detail: {
            Text("Please select a row")
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
