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
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon

    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    func think() {

        if leftSpoon.index < rightSpoon.index {
            self.leftSpoon.pickUp()
            print("\(self.name) picked up left spoon : \(leftSpoon.index)")
        } else {
            self.rightSpoon.pickUp()
            print("\(self.name) picked up right spoon : \(rightSpoon.index)")
        }
    }
    
    func eat() {
        print("\(self.name) is eating")
        usleep(UInt32.random(in: 100...500))
        leftSpoon.putDown()
        print("\(self.name) put left spoon down : \(leftSpoon.index)")
        rightSpoon.putDown()
        print("\(self.name) put right spoon down : \(rightSpoon.index)")
    }
    
    func run() {
        print("run")
        while true {
            think()
            eat()
            
        }
    }
}

var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)




var dev1 = Developer(name: "Harry", leftSpoon: spoon1, rightSpoon: spoon2)
var dev2 = Developer(name: "Hermoine", leftSpoon: spoon2, rightSpoon: spoon3)
var dev3 = Developer(name: "Ron", leftSpoon: spoon3, rightSpoon: spoon4)
var dev4 = Developer(name: "Fred", leftSpoon: spoon4, rightSpoon: spoon5)
var dev5 = Developer(name: "George", leftSpoon: spoon5, rightSpoon: spoon1)
var developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
