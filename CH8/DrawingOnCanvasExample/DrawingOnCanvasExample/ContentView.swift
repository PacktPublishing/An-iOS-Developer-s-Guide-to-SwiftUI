//
//  ContentView.swift
//  DrawingOnCanvasExample
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
            context.opacity = 0.6
            let rect = CGRect(origin: .zero, size: size)
            let text = Text(verbatim: "This is not a Text view!").font(.title)
                .bold()
            var resolvedText = context.resolve(text)
            resolvedText.shading = .color(.blue)
            context.draw(resolvedText, in: rect)
            var path = Circle().path(in: rect)
                       context.fill(path, with: .color(.green))
            let rect2 = rect.applying(.init(scaleX: 0.7, y: 0.7).translatedBy(x: 150, y: 300)
            )
                        path = Circle().path(in: rect2)
                        context.fill(path, with: .color(.pink))
            let rect3 = rect.applying(.init(scaleX: 0.2, y: 0.2).translatedBy(x: 150, y: 300)
            )
                        path = Circle().path(in: rect3)
                        context.fill(path, with: .color(.cyan))
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
