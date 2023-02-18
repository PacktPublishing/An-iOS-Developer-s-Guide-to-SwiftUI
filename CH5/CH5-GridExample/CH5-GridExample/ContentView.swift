//
//  ContentView.swift
//  CH5-GridExample
//
//  Created by Michele Fadda on 22/01/2023.
//

import SwiftUI


struct GridDemo: View {
    var body: some View {
        Grid() {
            GridRow {
                Text("[R1, C1]")
                Text("[R1, C2]")
            }
    
            GridRow {
                Text("[R2, C1]")
                Text("[R2, C2]")
            }
            GridRow {
                Text("[R3, C1]")
                Text("[R3, C2]")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GridDemo()
            Text("A Grid containing GridRows")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
