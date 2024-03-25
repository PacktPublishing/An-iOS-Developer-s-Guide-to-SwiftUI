//
//  ContentView.swift
//  Ch6-ModalFullScreenCover
//


import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color
                .yellow
                .edgesIgnoringSafeArea(.all)
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
            .padding()
            .border(.blue,width: 2)
        }
    }
}

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Show") {
            isPresented.toggle()
        }
        .foregroundColor(.white)
        .padding()
        .background(.blue)
        .clipped(antialiased: true)
        .border(.blue, width: 2)
        .cornerRadius(8)
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
