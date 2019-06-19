import UIKit




class Spoon {
    var lock = NSLock()
    
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
        print("Picked Up Spoon")
        lock.unlock()
    }
    
    
    func putDown() {
        lock.lock()
        print("Put Down Spoon")
        lock.unlock()
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
        //make sure the developer always picks up the spoon with the lower index first.
        if leftSpoon.index < rightSpoon.index {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        } else {
        rightSpoon.pickUp()
        leftSpoon.pickUp()
        }
        return
    }
    
    
    func eat() {
        usleep(3)
        leftSpoon.putDown()
        rightSpoon.putDown()
        
        
    }
    
    func run() {
        let alwaysTrue = true
        while alwaysTrue == true {
        think()
        print("Started eating")
        eat()
        print("Finished eating")
        }
    }
}

var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)

let developerJohn = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let developerTom = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let developerJulain = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let developerMichael = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
let developerPaul = Developer(leftSpoon: spoon5, rightSpoon: spoon1)


var developers: [Developer] = [developerJohn, developerTom, developerPaul, developerJulain, developerMichael]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
