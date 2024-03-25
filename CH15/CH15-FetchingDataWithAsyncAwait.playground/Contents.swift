// Make an indefinite execution to allow asynchronous tasks to complete
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

// Define a struct that conforms to Codable for the JSON Post
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
// Define an async function to perform the fetch
func fetchPost() async throws -> Post {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
        throw URLError(.badURL)
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    
    let post = try JSONDecoder().decode(Post.self, from: data)
    return post
}

// Use a Task to call the async function and handle the result or any errors
Task {
    do {
        let post = try await fetchPost()
        // Use the data (for example, print it to the console)
        print("Post Title: \(post.title)")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

