//
//  ContentView.swift
//  ControllingLayoutWithSpacer
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("one third of the way")
            Spacer()
            Spacer()

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
