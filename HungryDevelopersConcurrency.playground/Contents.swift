import Foundation

class Spoon {
    
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    func putDown() {
        lock.unlock()
    }
    
}

class Developer {
    
    let times = 0
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let seconds: UInt32 = UInt32.random(in: 0 ... 5)
    
    init() {
        leftSpoon = Spoon()
        rightSpoon = Spoon()
    }
    private func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    private func eat() {
        usleep(seconds)
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func run() {
        while times == 0 {
            think()
            eat()
        }
    }
}

var developers: [Developer] = []
for _ in 1...5 {
    let developer = Developer()
    developers.append(developer)
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
