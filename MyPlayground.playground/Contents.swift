import UIKit

var str = "Hello, playground"

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
    
}

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
        
        usleep(1000)
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
var devOne = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
var devTwo = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
var devThree = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
var devFour = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
var devFive = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

let allDevs: [Developer] = [devOne, devTwo, devThree, devFour, devFive]


DispatchQueue.concurrentPerform(iterations: 5) {
    allDevs[$0].run()
    
    print("Index \($0)")
}
