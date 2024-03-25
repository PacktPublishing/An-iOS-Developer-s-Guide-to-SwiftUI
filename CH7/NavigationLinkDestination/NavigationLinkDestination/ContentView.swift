//
//  ContentView.swift
//  NavigationLinkDestination
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    fileprivate func Destination() -> some View {
        Text("This is a destination View")
            .navigationTitle("Destination")

    }
    fileprivate func Destination2() -> some View {
        Text("This is another destination View")
            .navigationTitle("Another Destination")

    }
    fileprivate func Destination3() -> some View {
        Text("This is yet another destination View")
            .navigationTitle("Yet Another Destination")

    }
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: Destination()) {
                    Text("Navigation link1")
                }.padding()
                NavigationLink(destination: Destination2()) {
                    HStack{
                        Image(systemName: "globe")
                              Text("Navigation link2")
                    }
                    .padding()
                }
                NavigationLink(destination: Destination3()) {
                    Image(systemName: "cloud")
                }

            }
            .navigationTitle("Navigation")
        }
        .padding()
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
