//
//  ContentView.swift
//  CH6-Alert
//
//  Created by Michele Fadda on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        VStack{
            Text("The button shows an Alert")
            Divider()
            Button("Show") {
                showingAlert = true
            }
            .alert("The Alert is showing", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
