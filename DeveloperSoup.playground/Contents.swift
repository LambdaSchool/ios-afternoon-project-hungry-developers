import UIKit
import Foundation

let group = DispatchGroup()

class Spoon {
    
    var shared = NSLock()
    var index = Int()
    
    func pickUp() {
        // if called when spoon in use, must wait til other calls putDown()
        shared.lock()
    }
    
    func putDown() {
        shared.unlock()
    }
}

class Developer {
    var leftSpoon = Spoon()
    var rightSpoon = Spoon()
    var hasEaten: Bool = false
    var isEating: Bool = false
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        isEating = true
        print(isEating)
        usleep(1)
        leftSpoon.putDown()
        rightSpoon.putDown()
        hasEaten = true
        print(hasEaten)
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []


for x in 0...4 {
    let spoon = Spoon()
    spoon.index = x
    spoons.append(spoon)
}


let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

developer1.leftSpoon = spoons[0]
developer1.rightSpoon = spoons[1]

developer2.leftSpoon = spoons[1]
developer2.rightSpoon = spoons[2]

developer3.leftSpoon = spoons[2]
developer3.rightSpoon = spoons[3]

developer4.leftSpoon = spoons[3]
developer4.rightSpoon = spoons[4]

developer5.leftSpoon = spoons[4]
developer5.rightSpoon = spoons[0]



var developers: [Developer] = [developer1, developer2, developer3, developer4, developer5]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}









