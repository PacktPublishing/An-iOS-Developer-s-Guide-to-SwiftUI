//
//  ContentView.swift
//  TaskModifierExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

import SwiftUI

// simulate fetching items from an API.
func fetchItems() async throws -> [String] {
    // Simulating a network delay of one second
    try await Task.sleep(nanoseconds: 1_000_000_000)  // this function is throwing and can potentially fail
    return ["row 1", "row 2", "row 3", "row 4", "row 5"]
}

struct ContentView: View {
    @State private var items: [String] = []

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
                .foregroundColor(.green)
                .bold()
        }
        // Using the .task modifier to fetch items when the view appears.
        .task(priority: .userInitiated) {
            do {
                items = try await fetchItems()
            } catch {
                print("an error occurred")
            }
        }
        // shows a progress view while the items are being fetched.
        .overlay(items.isEmpty ? ProgressView().scaleEffect(3.0) : nil)
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
