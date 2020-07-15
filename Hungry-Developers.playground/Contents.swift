import Foundation

class Spoon {
   private let spoon = NSLock()
    
    var index = Int()
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        spoon.lock()
    }
    func putDown() {
        spoon.unlock()
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        // Should pick up both spoons before returning.
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
        }
    }
    func eat() {
        usleep(5)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) Filling tummy")
    }
    func run() {
        think()
        eat()
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "developer1")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "developer2")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "developer3")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "developer4")
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "developer5")

let developerArray = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developerArray[$0].run()
}
