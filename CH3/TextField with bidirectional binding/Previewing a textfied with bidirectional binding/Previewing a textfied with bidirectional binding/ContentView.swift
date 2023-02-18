//
//  ContentView.swift
//  Previewing a textfied with bidirectional binding
//
//  Created by Michele Fadda on 20/09/2022.
//

import SwiftUI

struct TextFieldExample: View {
    @State var name = "Michele"
    var body: some View {
        VStack (spacing:25) {
            Text("Changing the string in the Textfield will immediately update the Text output")
                .padding()
                            TextField("Enter your name here:",text: $name)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)
                            Spacer()
                            Text("Hello, \(name)!")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                            Spacer()
                        }
                    }
                }

                struct TextFieldExample_Previews: PreviewProvider {
                    static var previews: some View {
                        TextFieldExample()
                    }
                }
