//
//  UserService.swift
//  UrlSessionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import Foundation

// Define a service to fetch and decode the user data
class UserService {
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let users = try decoder.decode([User].self, from: data)
        
        return users
    }
}

