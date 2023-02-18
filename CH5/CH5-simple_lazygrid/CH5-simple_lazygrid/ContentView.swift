//
//  ContentView.swift
//  CH5-simple_lazygrid
//
//  Created by Michele Fadda on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),]) {
                        ForEach(1...300, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.cyan)
                                .frame(width: 60, height: 60)
                        }
                    }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
