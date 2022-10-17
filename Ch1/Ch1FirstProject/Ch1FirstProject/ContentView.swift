//
//  ContentView.swift
//  Ch1FirstProject
//
//  Created by Michele Fadda on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .foregroundColor(.red)
            .padding()
            .border(Color.blue, width: 3)
    }
}

struct ContentView2: View {
    var body: some View {
        Text("Hello, world!")
            .foregroundColor(.blue)
            .border(Color.blue, width: 3)
            .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView2()
    }
}
