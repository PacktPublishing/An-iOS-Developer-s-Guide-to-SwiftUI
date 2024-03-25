//
//  ContentView.swift
//  ActivatingNavigationLink
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI


struct AboutView: View{
    var body: some View {
        Text ("About view")
    }
}

struct ContentView: View {
    @State var linkActive = false
    var body: some View {
        NavigationView {
            Text("Activating a NavigationLink")
            // deprecated in iOS16
                .background(            NavigationLink(destination: AboutView(), isActive: $linkActive) {})

                .navigationTitle("Home View")
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }

                    ToolbarItemGroup(placement: .secondaryAction) {
                        Button("Settings") {
                            print("Settings tapped")
                        }
                        Button("About") {
                            print("About tapped")
                            linkActive = true
                        }
                    }
                }
        }
    }
}


#Preview {
    ContentView()
}
