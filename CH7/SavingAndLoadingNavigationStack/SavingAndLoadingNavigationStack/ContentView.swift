//
//  ContentView.swift
//  SavingAndLoadingNavigationStack
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navPath = PathFileStorage()

    var body: some View {
        NavigationStack(path: $navPath.navpath) {
            Button("Jump to 1") {
                navPath.navpath.append(Int(1))
            }
            Spacer()
            Button("Jump to 2") {
                navPath.navpath.append(Int(1))
                navPath.navpath.append(Int(2))
            }
            Spacer()
            Button("Jump to 3") {
                navPath.navpath.append(Int(1))
                navPath.navpath.append(Int(2))
                navPath.navpath.append(Int(3))
            }
            Spacer()
            Button("Jump to 4") {
                navPath.navpath.append(Int(1))
                navPath.navpath.append(Int(2))
                navPath.navpath.append(Int(3))
                navPath.navpath.append(Int(4))
            }

            List(1..<5) { i in
                NavigationLink(value: "String \(i)") {
                    Label("Link String \(i)", systemImage: "\(i).square")
                }
            }
            .navigationDestination(for: Int.self) { i in
                VStack{
                    Spacer()
                    Text("This is Detail View #\(i)")
                        .font(.title)
                    Spacer()
                    Button("Go Back Directly to Home") {
                        navPath.removeLast(i)
                    }
                    Spacer()
                    .navigationTitle("Numeric Detail")
                }

            }
            .navigationDestination(for: String.self) { i in
                VStack{
                    Spacer()
                    Text("This is Detail View '\(i)'")
                        .font(.title)
                    Spacer()
                    Button("Go Back Directly to Home") {
                        navPath.removeLast()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Home")
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
