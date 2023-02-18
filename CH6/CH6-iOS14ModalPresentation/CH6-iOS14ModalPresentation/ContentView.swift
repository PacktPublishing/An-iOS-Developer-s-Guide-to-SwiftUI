//
//  ContentView.swift
//  CH6-iOS14ModalPresentation
//
//  Created by Michele Fadda on 17/02/2023.
//

import SwiftUI

struct MainView: View {
    @State private var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet,
               onDismiss: { print("dismissed!") },
               content: { MySheet() })
    }
}

struct MySheet: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
        Text("This is my new Sheet")
            .onAppear {
                print("Showing")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        MainView()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
