import Foundation

class Spoon {
    private let lock = NSLock()
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
    var randomTime = UInt32.random(in: 5...10)
    var name: String
    
    func think() {
        if rightSpoon.index > leftSpoon.index {
            leftSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
        }
        
        return
    }
    
    func eat() {
        print("\(name) is eating")
        
        usleep(randomTime)
        leftSpoon.putDown()
        print("\(name) put down their left spoon.")
        
        rightSpoon.putDown()
        print("\(name) put down their right spoon.")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    init(leftSppon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSppon
        self.rightSpoon = rightSpoon
        self.name = name
    }
}

let spoonI = Spoon(index: 1)
let spoonII = Spoon(index: 2)
let spoonIII = Spoon(index: 3)
let spoonIV = Spoon(index: 4)
let spoonV = Spoon(index: 5)

let devA = Developer(leftSppon: spoonI, rightSpoon: spoonII, name: "david")
let devB = Developer(leftSppon: spoonII, rightSpoon: spoonIII, name: "brando")
let devC = Developer(leftSppon: spoonIII, rightSpoon: spoonIV, name: "daniel")
let devD = Developer(leftSppon: spoonIV, rightSpoon: spoonV, name: "ronald")
let devE = Developer(leftSppon: spoonV, rightSpoon: spoonI, name: "henry")
let developers = [devA, devB, devC, devD, devE]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
