//
//  ContentView.swift
//  CustomLayoutExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI
struct SpiralLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        let radius = min(bounds.size.width, bounds.size.height) / 2
        let maxCellNumber = 20.0
        let angleStep = 2 * .pi / maxCellNumber

        for (index, subview) in subviews.enumerated() {
            let cellNumber = Double(index)
            let cellRadius = radius * (cellNumber / maxCellNumber)
            let xPos = cos(angleStep * cellNumber - .pi / 2) * cellRadius
            let yPos = sin(angleStep * cellNumber - .pi / 2) * cellRadius
            let point = CGPoint(x: bounds.midX + xPos, y: bounds.midY + yPos)
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct ContentView: View {
    @State private var count = 15.0
    private let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]

    var body: some View {
        SpiralLayout {
            ForEach(0..<Int(count), id: \.self) { cellNumber in
                Text("\(cellNumber)")
                    .foregroundColor(colors[cellNumber % colors.count])
            }
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Text("Count: \(Int(count))")
                Slider(value: $count.animation(), in: 1...20)
            }
            .padding()
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
