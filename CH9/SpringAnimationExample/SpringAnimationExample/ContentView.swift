//
//  ContentView.swift
//  SpringAnimationExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct SpringAnimationView: View {
    @State private var boxOffset: CGSize = .zero

    var body: some View {
        VStack {
            Text("Drag the circle then let it go")
                .font(.title)

            Circle()
                .fill(.red)
                .opacity(0.5)
                .frame(width: 120, height: 120)
                .offset(boxOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gestureValue in
                            self.boxOffset = gestureValue.translation
                        }
                        .onEnded { _ in
                            self.boxOffset = .zero
                        }
                )
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.1), value: boxOffset)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            SpringAnimationView()
            
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
