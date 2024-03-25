//
//  ContentView.swift
//  EagerAndLazyStacks
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI
struct ContentView: View {

    var body: some View {
        
        VStack {
            Example()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Example: View {
    var body: some View {
        LazyVStack {
                Text("LazyVStack First Label")
                Spacer()
                Text("LazyVStack Second Label")
        }
        .border(Color.blue, width: 2)
        VStack {
                Text("VStack First Label")
                Spacer()
                Text("VStack Second Label")
                Spacer()
        }
        .border(Color.red, width: 2)
        Spacer()
    }
}


#Preview {
    ContentView()
}
