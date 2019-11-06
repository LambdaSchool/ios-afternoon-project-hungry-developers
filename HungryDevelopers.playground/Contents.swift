import Foundation

class Spoon {
    private let spoonLock = NSLock()
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        self.spoonLock.lock()
    }
    
    func putDown() {
        self.spoonLock.unlock()
    }
}

class Developer {
    var id: Int
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("Developer\(self.id) is thinking to eat.")
        
        // Caling first solution
         self.firstSolution()
//        if self.leftSpoon.index < self.rightSpoon.index {
//        self.leftSpoon.pickUp()
//        print("Developer\(self.id) picked up spoon \(leftSpoon.index).")
//        self.rightSpoon.pickUp()
//        print("Developer\(self.id) picked up spoon \(rightSpoon.index).")
//        return
//        }
    }
    
    /* First Solution (Part Four - Solution) */
    // a developer will always pick up their lower-numbered spoon first
    func firstSolution() {
        if self.leftSpoon.index < self.rightSpoon.index {
            self.leftSpoon.pickUp()
            print("Developer\(self.id) picked up spoon \(leftSpoon.index).")
            self.rightSpoon.pickUp()
            print("Developer\(self.id) picked up spoon \(rightSpoon.index).")
        } else {
            self.rightSpoon.pickUp()
            print("Developer\(self.id) picked up spoon \(rightSpoon.index).")
            self.leftSpoon.pickUp()
            print("Developer\(self.id) picked up spoon \(leftSpoon.index).")
        }
    }
    
    func eat() {
        print("Developer\(self.id) is eating.")
        usleep(UInt32.random(in: 1...10))
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            self.think()
            self.eat()
        }
    }
}

let group = DispatchGroup()
let lockDeveloper = NSLock()

/* Waiter (Arbitrator) Solution */
class Waiter {
    func wasAsked(by developer: Developer) {
        DispatchQueue.global().async {
            lockDeveloper.lock()
            developer.run()
            lockDeveloper.unlock()
        }
    }
}

var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)

var waiter = Waiter()

var developer1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon2)
var developer2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon3)
var developer3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon4)
var developer4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon5)
var developer5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon1)

var developers = [developer1, developer2, developer3, developer4, developer5]

// Only for first solution
DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }

// Waiter Solution
//DispatchQueue.concurrentPerform(iterations: 5) { waiter.wasAsked(by: developers[$0]) }





