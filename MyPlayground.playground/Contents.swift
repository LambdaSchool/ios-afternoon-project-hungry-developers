import UIKit

class Spoon {
    
    private let lock = NSLock()
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    var name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        print("\(name) started eating")
        usleep(.random(in: 1...10))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) stopped eating")
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

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Breena")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Jordan")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Janaiya")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "River")
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "PapaBear")

let developers = [developer1, developer2, developer3, developer4, developer5]

    DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    }
