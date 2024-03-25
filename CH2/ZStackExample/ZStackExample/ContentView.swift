//
//  ContentView.swift
//  ZStackExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                    Color.blue
                        .ignoresSafeArea()
                    VStack{
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Text ("This is behind")
                        Spacer()
                    }
                    Image(systemName: "icloud.fill")
                        .resizable()
                        .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 300, idealHeight: 300, maxHeight: 300, alignment: .center)
                        .foregroundColor(.pink)
                        
                    Text("This text is in front of the image")
                        .bold()
                        .foregroundColor(.white)
                }
    }
}

#Preview {
    ContentView()
}
