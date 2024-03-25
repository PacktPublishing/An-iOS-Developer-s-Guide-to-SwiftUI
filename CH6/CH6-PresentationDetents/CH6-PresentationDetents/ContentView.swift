//
//  ContentView.swift
//  CH6-PresentationDetents
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var showingDetentsBoundSheet = false

    var body: some View {
        Button("Show Detents") {
            showingDetentsBoundSheet.toggle()
        }
        .sheet(isPresented: $showingDetentsBoundSheet) {
            VStack{
                Text("presentationDetents allow the sheet to slide covering the screen partially")
            }
                .presentationDetents([.height(250)])
                .presentationDragIndicator(.visible)
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
