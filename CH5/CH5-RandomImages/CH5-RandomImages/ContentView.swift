//
//  ContentView.swift
//  CH5-RandomImages
//
//  Created by Michele Fadda on 22/01/2023.
//

import SwiftUI

struct ContentView: View {
    let items = (1...12).map { _ in UIImage.SymbolConfiguration(pointSize: CGFloat.random(in: 10...50), weight: .medium) }

    var body: some View {
        
        Grid(items, id: \.self) { item in
            Image(systemName: "star.fill").imageScale(.large).configure(item)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
