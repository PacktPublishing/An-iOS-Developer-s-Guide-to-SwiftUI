//
//  ContentView.swift
//  SimpleGestureExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    // The state is used to keep track of the gesture states
    @State private var scale: CGFloat = 1.0
    @State private var dragOffset = CGSize.zero
    @State private var longPressToggle = false
    
    var body: some View {
        Image(systemName: "paperplane.circle.fill")
            .resizable()
            .frame(width: 150, height: 150)
            .scaleEffect(scale) // apply scaling effect
            .offset(dragOffset) // apply dragging offset
            .opacity(longPressToggle ? 0.4 : 1.0) // change opacity on long press
            .foregroundColor(.cyan)
            .gesture(
                TapGesture(count: 2)
                    .onEnded { _ in
                        // Double tap resets all transformations
                        self.scale = 1.0
                        self.dragOffset = CGSize.zero
                    }
            )
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onChanged { _ in
                        // Update longPress state
                        self.longPressToggle = true
                    }
                    .onEnded { _ in
                        // Revert longPress state
                        self.longPressToggle = false
                    }
            )
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        // Update the dragOffset state
                        self.dragOffset = value.translation
                    }
                    .onEnded { _ in
                        // Scale up the image on drag end
                        self.scale += 0.2
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       }
}

