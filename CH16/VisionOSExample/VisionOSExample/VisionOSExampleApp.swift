//
//  VisionOSExampleApp.swift
//  VisionOSExample
//
//  Created by Michele Fadda on 18/01/2024.
//

import SwiftUI

@main
struct VisionOSExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
