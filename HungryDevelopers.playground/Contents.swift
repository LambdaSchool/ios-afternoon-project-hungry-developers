import UIKit

func developerEating() {
    sleep(2)
}

let lock = NSLock()

class Spoon {
    var isBeingUsed = false
    func pickUp() {
        if !isBeingUsed {
            isBeingUsed = true
        } else {
            return
        }
    }
    
    func putDown() {
        isBeingUsed = false
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
            lock.lock()
            leftSpoon.pickUp()
            rightSpoon.pickUp()
            lock.unlock()
            eat()
        } else {
            print("\(name) is thinking")
        }
    }
    
    func eat() {
        lock.lock()
        print("\(name) is eating")
        developerEating()
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) is finished eating.")
        lock.unlock()
    }
    
    func run() {
        think()
        eat()
    }
}

// 5 Developers
let twelveOclockDev = Developer(name: "twelveOclockDev", rightSpoon: elevenOclockSpoon, leftSpoon: oneOclockSpoon)
let twoOclockDev    = Developer(name: "twoOclockDev", rightSpoon: oneOclockSpoon, leftSpoon: threeOclockSpoon)
let fiveOclockDev   = Developer(name: "fiveOclockDev", rightSpoon: threeOclockSpoon, leftSpoon: sixOclockSpoon)
let sevenOclockDev  = Developer(name: "sevenOclockDev", rightSpoon: sixOclockSpoon, leftSpoon: nineOclockSpoon)
let tenOclockDev    = Developer(name: "tenOclockDev", rightSpoon: nineOclockSpoon, leftSpoon: elevenOclockSpoon)
let developers: [Developer] = [twelveOclockDev, twoOclockDev, fiveOclockDev, sevenOclockDev, tenOclockDev]

DispatchQueue.concurrentPerform(iterations: 10) {_ in
    //developers[$0].run()
    twelveOclockDev.run()
    twoOclockDev.run()
    fiveOclockDev.run()
    sevenOclockDev.run()
    tenOclockDev.run()
    
}
