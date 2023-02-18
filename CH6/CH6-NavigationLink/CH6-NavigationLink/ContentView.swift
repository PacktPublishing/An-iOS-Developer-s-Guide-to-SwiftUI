//
//  ContentView.swift
//  CH6-NavigationLink
//
//  Created by Michele Fadda on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Second View")) {
                VStack{
                    Text("Primary View")
                    NavigationLink(
                        /// 2
                        destination: Text("Secondary View"),
                        /// 3
                        label: {
                            Text("Navigate")
                        })
                    Text("First View")
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
