import Foundation
import PlaygroundSupport

// Enable indefinite execution to allow the asynchronous code to complete
PlaygroundPage.current.needsIndefiniteExecution = true

// Define a struct that conforms to AsyncSequence
struct AsyncCounter: AsyncSequence {
    typealias Element = Int
    let maxCount: Int
    
    // AsyncIterator defines how to generate elements
    struct AsyncCounterIterator: AsyncIteratorProtocol {
        let maxCount: Int
        var currentCount = 0
        
        mutating func next() async -> Int? {
            // Produce nil when reaching the max count to terminate the sequence
            if currentCount >= maxCount {
                return nil
            }
            
            let nextValue = currentCount
            currentCount += 1
            
            // Simulate an asynchronous operation
            do {
                await try Task.sleep(nanoseconds: UInt64(1_000_000_000))
            } catch {
                print ("An error occurred")
            }// 1 second
            return nextValue
        }
    }
    
    // Make an instance of the iterator when starting to loop
    func makeAsyncIterator() -> AsyncCounterIterator {
        return AsyncCounterIterator(maxCount: maxCount)
    }
    
}

// Use the asynchronous sequence
Task {
    for await number in AsyncCounter(maxCount: 5) {
        print("Received number: \(number)")
    }
    print("Sequence complete.")
}


