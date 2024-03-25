
import Foundation
import PlaygroundSupport

// Enable indefinite execution to allow the asynchronous code to complete
PlaygroundPage.current.needsIndefiniteExecution = true

// Async function to fetch data from a given URL
func fetchData(from url: URL) async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// Async function to demonstrate the use of async let and do-catch error handling
func performTask() async {
    let googleURL = URL(string: "https://www.google.com")!

    async let googleData: Data = fetchData(from: googleURL)

    do {
        let data = try await googleData
        print("Fetched data from Google with length: \(data.count) bytes")
    } catch {
        print("An error occurred: \(error)")
    }

    // Finish indefinite execution when the task is complete
    PlaygroundPage.current.finishExecution()
}


// Start the asynchronous task
Task {
    await performTask()
}

