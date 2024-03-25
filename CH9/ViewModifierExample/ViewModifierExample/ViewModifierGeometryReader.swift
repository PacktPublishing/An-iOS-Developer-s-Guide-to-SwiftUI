//
//  ViewModifierGeometryReader.swift
//  ViewModifierExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct MyViewModifier: ViewModifier {
    var namespace: Namespace.ID
    @Binding var selectedRowId: String?
    let currentRowId: String

    func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(id: currentRowId, in: namespace, anchor: .leading, isSource: selectedRowId == nil)
            .onTapGesture {
                withAnimation {
                    selectedRowId = currentRowId
                }
            }
    }
}

