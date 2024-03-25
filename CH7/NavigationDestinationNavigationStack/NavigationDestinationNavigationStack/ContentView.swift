//
//  ContentView.swift
//  NavigationDestinationNavigationStack
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



struct EmployeeView: View {
    let name: String

    var body: some View {
        Text("\(name)")
            .font(.largeTitle)
            .navigationTitle("Selected employee")
            .foregroundColor(.secondary)
    }
}

struct ContentView: View {
    let employee = [
        "Anne Loyd",
        "John Smith",
        "Sandra Brown",
        "Ken Richards",
        "Tommy Shepherd",
        "Amie Ross",
    ]

    var body: some View {
        NavigationStack {
            List(employee, id: \.self) { employee in
                NavigationLink(employee, value: employee)
            }
            .navigationDestination(for: String.self, destination: EmployeeView.init)
            .navigationTitle("Select an Employee")
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
