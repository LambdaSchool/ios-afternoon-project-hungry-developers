import Foundation

class Spoon {
    private let lock = NSLock()
     
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}

class Developer {
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var randomTime = UInt32.random(in: 5...10)
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        return
    }
    
    func eat() {
        usleep(randomTime)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    init(leftSppon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSppon
        self.rightSpoon = rightSpoon
    }
}

let spoonI = Spoon()
let spoonII = Spoon()
let spoonIII = Spoon()
let spoonIV = Spoon()
let spoonV = Spoon()

let devA = Developer(leftSppon: spoonI, rightSpoon: spoonII)
let devB = Developer(leftSppon: spoonII, rightSpoon: spoonIII)
let devC = Developer(leftSppon: spoonIII, rightSpoon: spoonIV)
let devD = Developer(leftSppon: spoonIV, rightSpoon: spoonV)
let devE = Developer(leftSppon: spoonV, rightSpoon: spoonI)
let developers = [devA, devB, devC, devD, devE]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
