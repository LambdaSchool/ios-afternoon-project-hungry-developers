import Foundation
//import UIKit

let lock = NSLock()

class Spoon {
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickup() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(left: Spoon, right: Spoon) {
        leftSpoon = left
        rightSpoon = right
    }
    
    func think() {
        leftSpoon?.pickup()
        rightSpoon?.pickup()
    }
    
    func eat() {
        print("Eating")
        usleep(UInt32.random(in: 1_000...10_000_000))
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let num = 5

var developers: [Developer] = []
var spoons: [Spoon] = []
for int in 0..<num {
    spoons.append(Spoon(index: int))
}

for int in 0..<num {
    if int == 0 {
        developers.append(Developer(left: spoons[num-1], right: spoons[int+1]))
    } else if int == 4 {
        developers.append(Developer(left: spoons[int-1], right: spoons[0]))
    } else {
        developers.append(Developer(left: spoons[int-1], right: spoons[int+1]))
    }
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
