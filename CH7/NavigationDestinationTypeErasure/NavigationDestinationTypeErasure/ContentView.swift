//
//  ContentView.swift
//  NavigationDestinationTypeErasure
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var presentedValues = NavigationPath()

    var body: some View {
        NavigationStack(path: $presentedValues) {
            NavigationLink(value: "String Example1") {
                Text("String Value")
            }
            Spacer()
            NavigationLink(value: "String Example2") {
                Text("Another String Value")
            }

            List(1..<30) { i in
                NavigationLink(value: i) {
                    Label("Int Number \(i)", systemImage: "\(i).square")
                        .foregroundColor(.accentColor)
                }
            }
            .navigationDestination(for: Int.self) { i in
                Text("Int value \(i)")
                    .navigationTitle("Int DetailView")

            }
            .navigationDestination(for: String.self) { i in
                Text("String Detail \(i)")
                    .navigationTitle("String DetailView")
            }
            .navigationTitle("Home")
        }
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
