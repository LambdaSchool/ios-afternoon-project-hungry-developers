import Foundation

class Spoon {
    let holding = NSLock()
    var available = true
    var index: Int
    
    init(_ index: Int) {
        self.index = index
    }
    
    func pickup() {
        holding.lock()
        available = false
        
//        if available {
//            holding.lock()
//            available = false
//        } else {
//            usleep(UInt32.random(in: 0...3300))
//            pickup()
//        }
        
//        if holding.try() {
//
//        } else {
//            usleep(UInt32.random(in: 0...3300))
//            pickup()
//        }
    }
    
    func putDown() {
        holding.unlock()
        available = true
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    var turns = 0
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            pickUpLeft()
            pickUpRight()
        } else {
            pickUpRight()
            pickUpLeft()
        }
        
        print("\(name): Got em both! Hurray!")
    }
    
    func pickUpLeft() {
        if leftSpoon.available {
            leftSpoon.pickup()
        } else {
            usleep(UInt32.random(in: 0...1000))
            pickUpLeft()
        }
    }
    
    func pickUpRight() {
        if rightSpoon.available {
            rightSpoon.pickup()
        } else {
            usleep(UInt32.random(in: 0...1000))
            pickUpRight()
        }
    }
    
    func eat() {
        usleep(UInt32.random(in: 0...50000))
        print("\(name): Finished eating! I will now be putting the spoons down good sirs. Thank you for your patience.")
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
//            turns += 1
//            if turns % 10 == 0 {
//                print("\(name) got \(turns) turns to eat.")
//                usleep(UInt32.random(in: 5000000...10000000))
//            }
        }
    }
}

var spoon1 = Spoon(1)
var spoon2 = Spoon(2)
var spoon3 = Spoon(3)
var spoon4 = Spoon(4)
var spoon5 = Spoon(5)

var dev1 = Developer(leftSpoon: spoon2, rightSpoon: spoon1, name: "dev1")
var dev2 = Developer(leftSpoon: spoon3, rightSpoon: spoon2, name: "dev2")
var dev3 = Developer(leftSpoon: spoon4, rightSpoon: spoon3, name: "dev3")
var dev4 = Developer(leftSpoon: spoon5, rightSpoon: spoon4, name: "dev4")
var dev5 = Developer(leftSpoon: spoon1, rightSpoon: spoon5, name: "dev5")

let developers = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
