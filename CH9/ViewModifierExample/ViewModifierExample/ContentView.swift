//
//  ContentView.swift
//  ViewModifierExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedItemId: String? = nil
    @Namespace private var animation

    var body: some View {
        ZStack {
            if let itemId = selectedItemId {
                VStack {
                    VStack{
                        Text("Detail view for item #\(itemId)")
                            .font(.largeTitle)
                            .padding()
                            .matchedGeometryEffect(id: itemId, in: animation)
                        Text("Touch me to go back")
                    }
                        .onTapGesture {
                            withAnimation {
                                selectedItemId = nil
                            }
                        }
                
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.cyan.ignoresSafeArea())
            } else {
                ScrollView {
                    ForEach(1..<11) { i in
                        Text("Row #\(i)")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .modifier(MyViewModifier(namespace: animation, selectedRowId: $selectedItemId, currentRowId: "\(i)"))
                    }
                }
            }
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
