import Foundation

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// Exponential Backoff Class inheriting from URLProtocol
class ExponentialBackoffURLProtocol: URLProtocol {
    static var requestCount = 0

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        Self.requestCount += 1
        
        // Calculate the backoff delay
        let backoffTime = pow(2.0, Double(Self.requestCount)) + Double.random(in: 0...1)
        
        // Start timing the request
        let startTime = Date()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + backoffTime) {
            // Randomly decide whether to simulate an error
            let simulateError = Bool.random()
            
            if simulateError {
                let error = NSError(domain: "ExponentialBackoff", code: 1, userInfo: [NSLocalizedDescriptionKey: "Simulated error"])
                self.client?.urlProtocol(self, didFailWithError: error)
            } else {
                // Normally, here you would load actual data, for demonstration we're just finishing successfully
                let fakeResponse = HTTPURLResponse(url: self.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                self.client?.urlProtocol(self, didReceive: fakeResponse, cacheStoragePolicy: .notAllowed)
                self.client?.urlProtocolDidFinishLoading(self)
            }
            
            // End timing and print the duration
            let endTime = Date()
            let duration = endTime.timeIntervalSince(startTime)
            print("Request \(Self.requestCount) finished in \(duration) seconds with \(simulateError ? "an error" : "success")")
        }
    }

    override func stopLoading() {
        // Implement to support cancellation, if needed
    }
}


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func fetchPost() async {
    do {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let post = try JSONDecoder().decode(Post.self, from: data)
        print("Post Title: \(post.title)")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

// Inject the custom URLProtocol for exponential backoff
let config = URLSessionConfiguration.default
config.protocolClasses = [ExponentialBackoffURLProtocol.self]
let session = URLSession(configuration: config)

// Run the async function
Task {
    await fetchPost()
}

