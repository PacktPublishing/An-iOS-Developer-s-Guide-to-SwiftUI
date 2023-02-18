//
//  ContentView.swift
//  Ch1FirstProject_PinkBackground
//
//  Created by Michele Fadda on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.pink
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(Color.white)
                .padding()
                .border(Color.black, width: 3)
        }
        .edgesIgnoringSafeArea(.all)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
