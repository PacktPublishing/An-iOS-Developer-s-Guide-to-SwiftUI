//
//  PathFileStorage.swift
//  SavingAndLoadingNavigationStack
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI

class PathFileStorage: ObservableObject {
    @Published var navpath = NavigationPath() {
        didSet {
            store()
        }
    }

    private let fileURL = URL.documentsDirectory.appending(path: "PathFileStorage")
    
    func store() {
        guard let json = navpath.codable else { return }

        do {
            let data = try JSONEncoder().encode(json)
            try data.write(to: fileURL)
        } catch {
            print("Could not store navigation stack representation")
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: fileURL) {
            if let navigationStackRepresentation = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                navpath = NavigationPath(navigationStackRepresentation)
                return
            }
        }
    }
}

