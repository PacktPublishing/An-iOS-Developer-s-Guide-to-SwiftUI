//
//  ContentView.swift
//  CH6-ModalView
//
//  Created by Michele Fadda on 16/02/2023.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        .font(.title)
        .foregroundColor(.red)
        .frame(minWidth: 120,minHeight: 90)
        .background(.regularMaterial)
        .cornerRadius(8.0)
    }
}

struct ContentView: View {
    @State var showingSheet = false

    var body: some View {
        Button("Show") {
            showingSheet.toggle()
        }.font(.title)
            .foregroundColor(.black)
            .frame(minWidth: 120,minHeight: 90)
            .background(.regularMaterial)
            .cornerRadius(8.0)
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
        .background(Color(.systemYellow))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
