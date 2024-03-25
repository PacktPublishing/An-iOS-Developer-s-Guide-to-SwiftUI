//
//  User.swift
//  UrlSessionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import Foundation
// Define a struct that conforms to Codable to decode the data
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

