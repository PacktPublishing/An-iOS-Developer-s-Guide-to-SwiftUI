//
//  ContentView.swift
//  ActivatingNavigationLinkiOS16
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
    @State var isPresentedAboutView = false
    var body: some View {
        NavigationStack {
            Text("Activating a NavigationLink")
                
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
                            isPresentedAboutView = true
                        }
                    }
                }                .navigationDestination(isPresented: $isPresentedAboutView , destination: {AboutView()}
                    )
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
