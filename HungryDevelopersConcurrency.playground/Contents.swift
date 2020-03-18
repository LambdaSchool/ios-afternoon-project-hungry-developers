import Foundation

class Spoon {
    
    private let lock = NSLock()
    var index: Int = 0
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    var index: Int = 0

    let times = 0
    var leftSpoon: Spoon
    var rightSpoon: Spoon
//    let seconds: UInt32 = UInt32.random(in: 0 ... 5)
    let seconds: UInt32 = 100000
    
    init() {
        self.index += 1
        leftSpoon = Spoon()
        leftSpoon.index = self.index
        rightSpoon = Spoon()
        rightSpoon.index = self.index
    }
    
    // TODO: Refactor so spoons are picked up based on lowest rank
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
var spoons: [Spoon] = []

for i in 1...5 {
    let spoon = Spoon()
    spoon.index = i
    spoons.append(spoon)
    let developer = Developer()
    developer.index = i
    developer.leftSpoon.index = i
    developer.rightSpoon.index = i + 1 // TODO: this needs work
    developers.append(developer)

}


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
