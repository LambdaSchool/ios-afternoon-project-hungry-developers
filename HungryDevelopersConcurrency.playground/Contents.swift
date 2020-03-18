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
//    let seconds: UInt32 = UInt32.random(in: 0 ... 5)
    let seconds: UInt32 = 100000
    let index: Int = Int.random(in: 1...5)
    
    init() {
        leftSpoon = Spoon()
        rightSpoon = Spoon()
    }
    
    private func think() {
        print("Developer #\(index) is thinking")
        leftSpoon.pickUp()
        print("Developer #\(index) picked up left spoon")
        rightSpoon.pickUp()
        print("Developer #\(index) picked up RIGHT spoon")
    }
    
    private func eat() {
        print("Developer #\(index) is eating.")
        usleep(seconds)
        rightSpoon.putDown()
        print("Developer #\(index) put down RIGHT spoon")

        leftSpoon.putDown()
        print("Developer #\(index) put down left spoon")
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
