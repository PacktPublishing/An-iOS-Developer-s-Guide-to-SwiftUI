//
//  ContentView.swift
//  NavigationLinkExamplePreiOS16
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



struct ContentView: View {
    fileprivate func Destination() -> Text {
        return Text("This is the destination View")
    }
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: Destination()) {
                Text("Navigation link!")
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
