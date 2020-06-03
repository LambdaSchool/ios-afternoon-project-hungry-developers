import Foundation

class Spoon {
    
    let spoon = NSLock()
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
    var name: String
    var rightSpoon: Spoon
    var leftSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
        
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
            
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        print("\(name) picked up spoon \(leftSpoon.index) & spoon \(rightSpoon.index)")
        return
    }
    
    func eat() {
        print("\(name) is eating")
        sleep(100)
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("\(name) is done eating")
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(name: "Nonye", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "Aster", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "Nichoel", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "Roz", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "Lemuel", leftSpoon: spoon5, rightSpoon: spoon1)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

