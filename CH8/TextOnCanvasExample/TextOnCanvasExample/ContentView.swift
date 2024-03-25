//
//  ContentView.swift
//  TextOnCanvasExample
//
//  Created by Michele Fadda on 25/03/2024.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        Canvas(
            opaque: false,
            colorMode: .linear,
            rendersAsynchronously: false
        ) { context, size in
            
            let rect = CGRect(origin: .zero, size: CGSize(width:400,height:400))
        
            if let mySymbol = context.resolveSymbol(id: 0x01) {
                context.draw(mySymbol, in: rect)
            }
        } symbols: {
            Text(verbatim: "Hello World")
                .foregroundColor(.blue)
                .bold()
                .tag(0x01)
                .padding()
                .background( .yellow)
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
