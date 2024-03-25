//
//  ContentView.swift
//  TransitionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



import SwiftUI

struct ContentView: View {
    @State private var isShowingSquare = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isShowingSquare.toggle()
                }
            }) {
                Text(self.isShowingSquare ? "disappear":"appear")
            }

            if isShowingSquare {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 250, height: 250)
                    .border(.blue, width: 5)
                    .transition(.myCustomTransition)
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
