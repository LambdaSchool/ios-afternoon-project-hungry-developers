import UIKit

func developerEating(developer: String) {
    print("\(developer) is eating.")
    usleep(1_000_000)
}

let lock = NSLock()

class Spoon {
    var isBeingUsed = false
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    func pickUp() {
        if !isBeingUsed {
            isBeingUsed = true
        }
    }
    
    func putDown() {
        isBeingUsed = false
    }
}

// 5 Spoons
let oneOclockSpoon    = Spoon(index: 1)
let threeOclockSpoon  = Spoon(index: 2)
let sixOclockSpoon    = Spoon(index: 3)
let nineOclockSpoon   = Spoon(index: 4)
let elevenOclockSpoon = Spoon(index: 5)
let spoons: [Spoon] = [oneOclockSpoon, threeOclockSpoon, sixOclockSpoon, nineOclockSpoon, elevenOclockSpoon]

class Developer {
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, rightSpoon: Spoon, leftSpoon: Spoon) {
        self.name = name
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    func think() {
        lock.lock()
        if !leftSpoon.isBeingUsed && !rightSpoon.isBeingUsed {
            if leftSpoon.index < rightSpoon.index {
                leftSpoon.pickUp()
                print("\(name) picked up left spoon")
            } else {
                rightSpoon.pickUp()
                print("\(name) picked up right spoon")
            }
            lock.unlock()
            eat()
        } else {
            print("\(name) is thinking")
            lock.unlock()
            return
        }
    }
    
    func eat() {
        lock.lock()
        developerEating(developer: "\(name)")
        leftSpoon.putDown()
        print("\(name) put leftSpoon Down")
        rightSpoon.putDown()
        print("\(name) put rightSpoon Down")
        lock.unlock()
        print("\(name) is finished eating.")
    }
    
    func run() {
        while self != nil {
            think()
            eat()
        }
    }
}

// 5 Developers
let twelveOclockDev = Developer(name: "twelveOclockDev", rightSpoon: elevenOclockSpoon, leftSpoon: oneOclockSpoon)
let twoOclockDev    = Developer(name: "twoOclockDev", rightSpoon: oneOclockSpoon, leftSpoon: threeOclockSpoon)
let fiveOclockDev   = Developer(name: "fiveOclockDev", rightSpoon: threeOclockSpoon, leftSpoon: sixOclockSpoon)
let sevenOclockDev  = Developer(name: "sevenOclockDev", rightSpoon: sixOclockSpoon, leftSpoon: nineOclockSpoon)
let tenOclockDev    = Developer(name: "tenOclockDev", rightSpoon: nineOclockSpoon, leftSpoon: elevenOclockSpoon)
let developers: [Developer] = [twelveOclockDev, twoOclockDev, fiveOclockDev, sevenOclockDev, tenOclockDev]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
