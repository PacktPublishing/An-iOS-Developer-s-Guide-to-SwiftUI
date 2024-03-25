//
//  ContentView.swift
//  ButtonsInNavigationBar
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Example of adding tabbaritems")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Menu") {
                            print("Menu tapped!")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }

                }
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
