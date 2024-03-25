
import Foundation
var results: [Int] = []
func rollDice() async throws -> Int {
    // wait from 1 to 2 seconds
    try await Task.sleep(nanoseconds: UInt64(Int.random(in: 1_000_000_000...2_000_000_000)))
    return Int.random(in: 1...6) // simulate casting a die
}
// Create an async function to run the task group
func rollMultipleDice() async {
    await withTaskGroup(of: Result<Int, Error>.self) { group in
        // Add 6 tasks to the group
        for _ in 1...6 {
            group.addTask {
                do {
                    let value = try await rollDice()
                    return .success(value)
                } catch {
                    return .failure(error)
                }
            }
        }

 // wait for children completion, collecting the results
        for await result in group {
            switch result {
            case .success(let value):
                results.append(value)
            case .failure(let error):
                print("An error occurred: \(error)")
            }
        }
    }
}

// Execute the async function that instantiates the Group
Task {
    await rollMultipleDice()
    print("Results: \(results)")
}

