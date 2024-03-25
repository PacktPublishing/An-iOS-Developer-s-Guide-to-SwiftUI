//
//  ContentView.swift
//  SimpleGestureWithAnimationExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {

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
                        withAnimation {
                            self.scale = 1.0
                            self.dragOffset = CGSize.zero
                        }
                    }
            )
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onChanged { _ in
                        withAnimation {
                            self.longPressToggle = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            self.longPressToggle = false
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation {
                            self.dragOffset = value.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            self.scale += 0.2
                        }
                    }

            )
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
