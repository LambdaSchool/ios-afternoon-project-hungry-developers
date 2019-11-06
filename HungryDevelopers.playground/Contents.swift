import UIKit



class Spoon {
    let lock = NSLock()
    var index = Int()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        print("Start eating")
        usleep(UInt32.random(in: 1000...10000000))
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        print("Stop eating")
    }
    
    func run() {
        think()
        eat()
    }
}

var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

spoon1.index = 1
spoon2.index = 2
spoon3.index = 3
spoon4.index = 4
spoon5.index = 5

let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

var developerArray: [Developer] = []
developerArray.append(contentsOf: [developer1,developer2,developer3,developer4,developer5])

developer1.leftSpoon = spoon1
developer1.rightSpoon = spoon2

developer2.leftSpoon = spoon2
developer2.rightSpoon = spoon3

developer3.leftSpoon = spoon3
developer3.rightSpoon = spoon4

developer4.leftSpoon = spoon4
developer4.rightSpoon = spoon5

developer5.leftSpoon = spoon5
developer5.rightSpoon = spoon1

DispatchQueue.concurrentPerform(iterations: 5) { developerArray[$0].run() }
