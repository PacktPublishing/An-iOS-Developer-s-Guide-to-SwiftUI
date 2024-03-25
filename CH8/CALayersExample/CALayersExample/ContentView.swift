//
//  ContentView.swift
//  CALayersExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CircleView()
            .frame(width: 200, height: 200)
            .background(Color.cyan)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CircleView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        
        // Create a CAShapeLayer to draw a circle
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 200, height: 200))
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 4
        containerView.layer.addSublayer(shapeLayer)
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No need to update anything for this simple example
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
