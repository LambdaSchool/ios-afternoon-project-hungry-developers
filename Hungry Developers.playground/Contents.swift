import UIKit

class Spoon {
    
    let lock = NSLock()
    var spoonIndex: Int
    
    init(index: Int) {
        self.spoonIndex = index
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
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
        leftSpoon.pickUp()
        print("\(name) has picked up Left Spoon.")
        rightSpoon.pickUp()
        print("\(name) has picked up Right Spoon.")
        usleep(500)
    }
    
    func eat() {
        usleep(500)
        rightSpoon.putDown()
        print("\(name) has put down Right Spoon.")
        leftSpoon.putDown()
        print("\(name) has put down Left Spoon.")
        
    }
    
    func run() {
        think()
        eat()
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)

var developers: [Developer] = []

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev1")
let developer2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev2")
let developer3 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev3")
let developer4 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev4")

developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)

let begin = Date()

DispatchQueue.concurrentPerform(iterations: 4) {
    developers[$0].run()
}
let endDate = Date()

print("It took: \(endDate.timeIntervalSince(begin)) seconds.")

