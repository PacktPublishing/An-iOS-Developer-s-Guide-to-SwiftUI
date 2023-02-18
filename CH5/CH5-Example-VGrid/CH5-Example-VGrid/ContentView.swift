//
//  ContentView.swift
//  CH5-Example-VGrid
//
//  Created by Michele Fadda on 22/01/2023.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack{
            Grid {
                GridRow {
                    Image(systemName: "umbrella")
                    Image(systemName: "cloud")
                    Image(systemName: "heart")
                }
                Divider()
                GridRow {
                    Image(systemName: "hand.wave")
                    Image(systemName: "arrow.left")
                    Image(systemName: "arrow.left")
                }
                Divider()
                GridRow {
                    Image(systemName: "arrow.down")
                    Image(systemName: "arrow.up")
                    Image(systemName: "arrow.right")
                }
            }
            .foregroundColor(.red)
            Text("A Grid with Dividers and images")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
