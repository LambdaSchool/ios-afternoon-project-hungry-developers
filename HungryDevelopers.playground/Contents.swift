import UIKit

func developerEating(developer: String) {
    print("\(developer) is eating.")
    sleep(2)
}

let lock = NSLock()

class Spoon {
    var isBeingUsed = false
    private var spoonLock = NSLock()
    func pickUp() {
        if !isBeingUsed {
           spoonLock.lock()
            isBeingUsed = true
            spoonLock.unlock()
        }
    }
    
    func putDown() {
        spoonLock.lock()
        isBeingUsed = false
        spoonLock.unlock()
    }
}

// 5 Spoons
let oneOclockSpoon    = Spoon()
let threeOclockSpoon  = Spoon()
let sixOclockSpoon    = Spoon()
let nineOclockSpoon   = Spoon()
let elevenOclockSpoon = Spoon()
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
        if !leftSpoon.isBeingUsed && !rightSpoon.isBeingUsed {
            //lock.lock()
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
           //lock.unlock()
            eat()
        } else {
            print("\(name) is thinking")
        }
    }
    
    func eat() {
        developerEating(developer: "\(name)")
        //lock.lock()
        leftSpoon.putDown()
        print("\(name) put leftSpoon Down")
        rightSpoon.putDown()
        print("\(name) put rightSpoon Down")
        //lock.unlock()
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

DispatchQueue.concurrentPerform(iterations: 10) {
    developers[$0].run()
}
