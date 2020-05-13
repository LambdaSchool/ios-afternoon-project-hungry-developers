// Kevin Stewart

import UIKit
import Foundation

class Spoon {
    var lock = NSLock()
    
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
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        print("\(name) is picking up their left spoon.")
        rightSpoon.pickUp()
        print("\(name) is picking up their right spoon.")
    }
    
    func eat() {
        let randomMS: UInt32 = arc4random_uniform(UInt32.max) * 0_0001
        usleep(randomMS)
        print("\(name) finished eatting.")
        
        leftSpoon.putDown()
        print("\(name) is putting up their left spoon.")
        rightSpoon.putDown()
        print("\(name) is putting up their right spoon.")
    }
    
    func run() {
        while true {
            eat()
            think()
        }
    }
}

var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)

var developer1 = Developer(name: "Kate", leftSpoon: spoon5, rightSpoon: spoon1)
var developer2 = Developer(name: "Tyler", leftSpoon: spoon1, rightSpoon: spoon2)
var developer3 = Developer(name: "Emily", leftSpoon: spoon2, rightSpoon: spoon3)
var developer4 = Developer(name: "Derek", leftSpoon: spoon3, rightSpoon: spoon4)
var developer5 = Developer(name: "Allison", leftSpoon: spoon4, rightSpoon: spoon5)

var developers: [Developer] = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
