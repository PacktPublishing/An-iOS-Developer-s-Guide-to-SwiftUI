//
//  Transition.swift
//  TransitionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

// Defining custom Transition
extension AnyTransition {
    static var myCustomTransition: AnyTransition {
        let insertion = AnyTransition.scale.combined(with: .opacity).animation(.easeInOut(duration: 2))
        let removal = AnyTransition.scale.combined(with: .opacity).animation(.easeInOut(duration: 1))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
