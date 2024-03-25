//
//  UserListModel.swift
//  UrlSessionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

// Define the Model
@MainActor
class UserListModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String? = nil
    
    let service = UserService()
    
    func loadUsers() async {
        do {
            let users = try await service.fetchUsers()
            self.users = users
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}

