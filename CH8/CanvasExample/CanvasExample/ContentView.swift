//
//  ContentView.swift
//  CanvasExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI
struct CircleView: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path { path in
                    path.addEllipse(in: CGRect(origin: .zero, size: size))
                },
                with: .color(.green),
                lineWidth: 2
            )
            context.stroke(
                Path { path in
                    path.addEllipse(in: CGRect(origin: .zero, size: CGSize(width: size.width/2, height: size.height/2)))
                },
                with: .color(.green),
                lineWidth: 2
            )
        }
        .frame(width: 300, height: 300)
        .border(Color.blue)
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            CircleView()
            Text("Canvas View")
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
