
import Foundation
import PlaygroundSupport

// Enable indefinite execution to allow the asynchronous code to complete
PlaygroundPage.current.needsIndefiniteExecution = true

func fetchData(from url: URL) async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

Task {
    do {
        let url = URL(string: "https://google.com")!
        let data = try await fetchData(from: url)
        print(data)
    } catch {
        print("Error fetching data: \(error)")
    }
}


