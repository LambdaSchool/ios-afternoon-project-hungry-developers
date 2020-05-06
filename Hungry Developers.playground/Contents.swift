import UIKit

class Spoon {
    
    private let lock = NSLock()
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    
    let name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.putDown()
        return
    }
    
    func eat() {
        usleep(1000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        return
    }
    
    func run() {
        think()
        eat()
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(name: "Chris", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "Tommy", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "Ariana", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "Jessica", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "David", leftSpoon: spoon5, rightSpoon: spoon1)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}


