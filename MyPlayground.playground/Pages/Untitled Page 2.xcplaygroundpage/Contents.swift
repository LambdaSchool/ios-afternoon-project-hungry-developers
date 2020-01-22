//: [Previous](@previous)

import Foundation

class Spoon {
    
    var index: Int
    private let lock = NSLock()
    
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

extension NSLock {
    func withLock(_ work: () -> Void) {
        lock()
        work()
        unlock()
    }
}

class Developer {
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    
    func think() {
        let randomSideSelector = Bool.random()
        if randomSideSelector {
        leftSpoon.pickUp()
        print("left spoon picked up true")
        rightSpoon.pickUp()
        print("right spoon picked up true")
        } else {
            rightSpoon.pickUp()
            print("right spoon picked up false")
            leftSpoon.pickUp()
            print("left spoon picked up false")
        }
        eat()
            return
    }
    
    func eat() {
        usleep(500)
        rightSpoon.putDown()
        leftSpoon.putDown()
        return
    }
    
    func run() {
        think()
        eat()
        print("I ate")
        run()
    }
}

var spoons: [Spoon] = []
let s1 = Spoon(index: 1)
let s2 = Spoon(index: 2)
let s3 = Spoon(index: 3)
let s4 = Spoon(index: 4)
let s5 = Spoon(index: 5)

let d1 = Developer(leftSpoon: s1, rightSpoon: s5)
let d2 = Developer(leftSpoon: s2, rightSpoon: s1)
let d3 = Developer(leftSpoon: s3, rightSpoon: s2)
let d4 = Developer(leftSpoon: s4, rightSpoon: s3)
let d5 = Developer(leftSpoon: s5, rightSpoon: s4)
let developers = [d1, d2, d3, d4, d5]

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }


//: [Next](@next)
