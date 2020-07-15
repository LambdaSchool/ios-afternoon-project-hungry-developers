import Foundation

var counter = 42

// Add 100 concurrently
// Queueing 100 operations to occur
// 16 threads (they're going in the right order)
// Adding +1 may not necessarily finish in the right order

// Must route electricity to the memory and back
// 3Ghz -> 3 million operations per second
// Nondeterministic -> each time you execute it, the results are different

let locksmith = NSLock()
DispatchQueue.concurrentPerform(iterations: 100) { _ in
    locksmith.lock()
    counter += 1
    locksmith.unlock()
}

print(counter)

// -------------------------

extension NSLock {
    // func -> I'm going to do something and I'm giving it a name
    // label: lock
    // parameters: _ closure
    
    // closures = functions
    // Networking -> didSucceed: Closure, didFail: Closure
    // Closures are nameless (anonymous functions)
    // Closure parameters: None
    // Closurre return values: Void
    
    func lock(_ closure: () -> Void) {
        self.lock() // No need to use self
        closure()
        self.unlock()
    }
}

DispatchQueue.concurrentPerform(iterations: 50) { _ in
    locksmith.lock {
        counter += 1
    }
}

print(counter)

// -------------------------

let serialQueue = DispatchQueue(label: "counter serial queue")
// Add 25 concurrently
// 16 threads -> 2 iterations
// >>> "Delivering the boxes is very quick"
DispatchQueue.concurrentPerform(iterations: 25) { _ in
    // Every time this closure gets executed, we add
    // the following closure to the queue.
    
    // Add 25 serially
    // >>> "opening the boxes is very slow"
    serialQueue.sync {
        counter += 1
    }
}

print(counter)
