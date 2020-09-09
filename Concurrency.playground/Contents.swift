import UIKit


class Spoon {
    
    private var lock = NSLock()
    var index: Int
   
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    
    init(index: Int) {
        self.index = index
    }
    
}//


class Developer {
   
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    
    func think() {
        if leftSpoon.index > rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    
    func eat() {
        
        usleep(1_000_000)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}//

// Spoons
var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)



// Developers
var developerOne = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
var developerTwo = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
var developerThree = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
var developerFour = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
var developerFive = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

let allDev: [Developer] = [developerOne, developerTwo, developerThree, developerFour, developerFive]


DispatchQueue.concurrentPerform(iterations: 5) {
    allDev[$0].run()
    
    print("Index \($0)")
}

