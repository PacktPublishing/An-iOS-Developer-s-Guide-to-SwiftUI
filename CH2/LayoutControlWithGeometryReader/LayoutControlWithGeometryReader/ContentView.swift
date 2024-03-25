//
//  ContentView.swift
//  LayoutControlWithGeometryReader
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            Color.blue.ignoresSafeArea()

            Text("Center top") .position(x:geometry.size.width/2,y: geometry.size.height/30)
            Text("Center one fifth height") .position(x:geometry.size.width/2,y: geometry.size.height/5)
            Image(systemName: "folder")
                .position(x:geometry.size.width/3,y: geometry.size.height/2)
            Text("Center bottom") .position(x:geometry.size.width/2,y: geometry.size.height-30)
        }
        .foregroundColor(.white)
    }
}




#Preview {
    ContentView()
}
