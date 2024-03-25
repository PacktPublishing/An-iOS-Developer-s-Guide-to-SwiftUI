
import Foundation
import PlaygroundSupport

// Enable indefinite execution to allow the asynchronous code to complete
PlaygroundPage.current.needsIndefiniteExecution = true

func log(_ i: Int) async {
    print("value:", i)
    // The delay makes the problem easier to reproduce

    try! await Task.sleep(nanoseconds: 2_000_000_000)
}

actor Counter {
    var count: Int = 0
    
    func increment() async -> Int {
        let oldValue = self.count
        //await log(oldValue) // uncomment this line to evidence the problem
        let newValue = oldValue + 1
        self.count = newValue
        return newValue
    }
}

Task {
        let counter = Counter()
        async let c1 = counter.increment()
        async let c2 = counter.increment()
        await print("c1:", c1)
        await print("c2:", c2)
}

// replace the faulty increment function with the following one
/* 
func increment() async -> Int {
        while true {
            let oldValue = self.count
            await log(oldValue)
            guard self.count == oldValue else { continue }
            let newValue = oldValue + 1
            self.count = newValue
            return newValue
        }
    }
*/
