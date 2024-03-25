//
//  ContentView.swift
//  ShowingNavigationBarTitle
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("This is a simple view")
                Text("inside a NavigationView")
                    .navigationTitle("Navigation Title")
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
