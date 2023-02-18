//
//  ContentView.swift
//  Ch5-HorizontalScroll
//
//  Created by Michele Fadda on 26/01/2023.
//

import SwiftUI


struct RotationModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}


extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(RotationModifier(action: action))
    }
}


struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        VStack {
            switch orientation {
            case .faceDown:
                Text("Face Down")
            case .unknown:
                Text("unknown")
            case .portrait:
                Text("Portrait")
            case .portraitUpsideDown:
                Text("Portrait Upside Down")
            case .landscapeLeft:
                Text("Landscape Left")
            case .landscapeRight:
                Text("Landscape Right")
            case .faceUp:
                Text("Face Up")
            @unknown default:
                Text("unknown position")
            }
            
            Text("I am showing device orientation").foregroundColor(.secondary)
            
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
