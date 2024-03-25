//
//  ContentView.swift
//  ViewsAlignment
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



struct ContentView: View {
    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .brown, .pink, .gray, .black]
    var shuffledColors: [Color] { colors.shuffled() }

    var body: some View {
        let randomizedColors = shuffledColors
        return ScrollView {
            VStack(spacing: 20) {
                alignmentBox(.leading, color: randomizedColors[0], text: "Leading")
                alignmentBox(.center, color: randomizedColors[1], text: "Center")
                alignmentBox(.trailing, color: randomizedColors[2], text: "Trailing")
                alignmentBox(.top, color: randomizedColors[3], text: "Top")
                alignmentBox(.bottom, color: randomizedColors[4], text: "Bottom")
                alignmentBox(.topLeading, color: randomizedColors[5], text: "TopLeading")
                alignmentBox(.topTrailing, color: randomizedColors[6], text: "TopTrailing")
                alignmentBox(.bottomLeading, color: randomizedColors[7], text: "BottomLeading")
                alignmentBox(.bottomTrailing, color: randomizedColors[8], text: "BottomTrailing")
            }
            .padding()
        }
    }
    
    func alignmentBox(_ alignment: Alignment, color: Color, text: String) -> some View {
        Text(text)
            .frame(width: 300, height: 60, alignment: alignment)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
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
