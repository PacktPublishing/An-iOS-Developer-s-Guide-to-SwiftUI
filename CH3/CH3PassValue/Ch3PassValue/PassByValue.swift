//
//  ContentView.swift
//  Ch3PassValue
//
//  Created by Michele Fadda on 19/06/2022.
//

import SwiftUI

struct PassByValue: View {
    var name = "Michael"
    var body: some View {
        VStack(spacing:25) {
            Text("My Name is:")
                .font(.headline)
                .fontWeight(.light)
                .padding()
            Text("\(name)")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            Spacer()
            Text("Although the default name is Michael, it gests replaced on invocation")
                .foregroundColor(.red)
            Spacer()

        }
    }
}

struct PassByValue_Previews: PreviewProvider {
    static var previews: some View {
        PassByValue(name:"Peter")
    }
}
