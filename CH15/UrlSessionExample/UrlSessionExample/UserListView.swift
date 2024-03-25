//
//  ContentView.swift
//  UrlSessionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

import SwiftUI

// Define the list view
struct UserListView: View {
    @StateObject var model = UserListModel()
    
    var body: some View {
        NavigationView {
            List(model.users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                Task {
                    await model.loadUsers()
                }
            }
            .alert("Error", isPresented: Binding<Bool>.constant($model.errorMessage.wrappedValue != nil), actions: {}, message: { Text($model.errorMessage.wrappedValue ?? "") })
        }
    }
}
#Preview {
    UserListView()
}



