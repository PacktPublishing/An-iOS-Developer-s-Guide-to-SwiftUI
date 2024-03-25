//
//  ContentView.swift
//  ComplexAnimationExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ZoomableRotatingView: View {
    @State private var rotateImage = false
    @GestureState private var scale: CGFloat = 1.0

    var body: some View {
        Image(systemName: "triangle.circle.fill")
            .font(.system(size: 200))
            .rotationEffect(.degrees(rotateImage ? 360 : 0))
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .updating($scale) { currentState, gestureState, transaction in
                        gestureState = currentState
                    }
            )
            .onAppear() {
                withAnimation(Animation.linear(duration: 15.0).repeatForever(autoreverses: true)) {
                    self.rotateImage = true
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ZoomableRotatingView()
                .foregroundColor(.accentColor)
            Text("Pinch me to zoom!")
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
