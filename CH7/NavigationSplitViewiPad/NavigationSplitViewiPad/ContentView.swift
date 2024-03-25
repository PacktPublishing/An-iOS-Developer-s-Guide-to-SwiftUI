//
//  ContentView.swift
//  NavigationSplitViewiPad
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationSplitView {
                Text("Side View")
            } detail: {
                Text("Detail View")
            }
        }
    }
}


#Preview {
    ContentView()
}
