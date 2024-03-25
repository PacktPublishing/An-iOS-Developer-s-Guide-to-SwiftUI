import Foundation
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

enum NetworkError: Error {
    case badStatus, koStatus
    case badURL, failedRequest
}
func fetchData(from urlString: String) async -> Result<Data, NetworkError> {
    guard let url = URL(string: urlString) else {
        return .failure(.badURL)
    }
    let request = URLRequest(url: url)
    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            return .failure(.koStatus)
        }
        return .success(data)
    } catch {
        return .failure(.failedRequest)
    }
}

// Invoke fetchData()
Task {
    let result = await fetchData(from: "https://jsonplaceholder.typicode.com/todos/10")
    switch result {
    case .success(let data):
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            print(json)
        }
    case .failure(let error):
        print("Error: \(error)")
    }
}

