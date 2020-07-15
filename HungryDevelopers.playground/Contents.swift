import Foundation

class Spoon {
    
    let lock = NSLock()
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
    
    let name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("\(name) is thinking.")
        
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        print("\(name) is done thinking.")
    }
    
    func eat() {
        
        print("\(name) started eating.")
        usleep(3)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) stopped eating.")
    }
    
    func run() {
        think()
        eat()
        run()
    }
    
}

let spoonOne = Spoon(index: 1)
let spoonTwo = Spoon(index: 2)
let spoonThree = Spoon(index: 3)
let spoonFour = Spoon(index: 4)
let spoonFive = Spoon(index: 5)

let developerOne = Developer(name: "Joe", leftSpoon: spoonFive, rightSpoon: spoonOne)
let developerTwo = Developer(name: "Jim", leftSpoon: spoonOne, rightSpoon: spoonTwo)
let developerThree = Developer(name: "James", leftSpoon: spoonTwo, rightSpoon: spoonThree)
let developerFour = Developer(name: "John", leftSpoon: spoonThree, rightSpoon: spoonFour)
let developerFive = Developer(name: "Jack", leftSpoon: spoonFour, rightSpoon: spoonFive)

var developers: [Developer] = [developerOne, developerTwo, developerThree, developerFour, developerFive]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
