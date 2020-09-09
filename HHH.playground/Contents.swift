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
    var devCall: String
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        return
    }
    
    func eat() {
        print("\(devCall) is eating")
        
        usleep(randomTime)
        leftSpoon.putDown()
        print("\(devCall) put down their left spoon.")
        
        rightSpoon.putDown()
        print("\(devCall) put down their right spoon.")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    init(leftSppon: Spoon, rightSpoon: Spoon, devCall: String) {
        self.leftSpoon = leftSppon
        self.rightSpoon = rightSpoon
        self.devCall = devCall
    }
}

let spoonI = Spoon()
let spoonII = Spoon()
let spoonIII = Spoon()
let spoonIV = Spoon()
let spoonV = Spoon()

let devA = Developer(leftSppon: spoonI, rightSpoon: spoonII, devCall: "devA")
let devB = Developer(leftSppon: spoonII, rightSpoon: spoonIII, devCall: "devB")
let devC = Developer(leftSppon: spoonIII, rightSpoon: spoonIV, devCall: "devC")
let devD = Developer(leftSppon: spoonIV, rightSpoon: spoonV, devCall: "devD")
let devE = Developer(leftSppon: spoonV, rightSpoon: spoonI, devCall: "devE")
let developers = [devA, devB, devC, devD, devE]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
