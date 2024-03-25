//
//  UserDetailView.swift
//  UrlSessionExample
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack {
            
            Text(user.name)
                .font(.title)
            Text(user.username)
                .font(.headline)
            Text(user.email)
                .font(.subheadline)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    UserDetailsView(user: User( id: 2,
        name: "Jerome",
        username: "Jerry",
        email: "jerry@example.com"))
}
