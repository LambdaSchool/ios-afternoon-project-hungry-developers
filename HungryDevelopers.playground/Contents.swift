import Foundation

//MARK: - Properties and Classes
class Spoon {
    var index: Int
    private(set) var isLocked: Bool = false
    private var lock = NSLock()
    
    func pickUp() {
        lock.lock()
        isLocked = true
    }
    
    func putDown() {
        lock.unlock()
        isLocked = false
    }
    
    init(index: Int) {
        self.index = index
    }
}


class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
        }
        print("Thinking")
    }
    
    func eat() {
        if leftSpoon.isLocked {
            rightSpoon.pickUp()
        } else {
            leftSpoon.pickUp()
        }
        
        usleep(5)
        print("Eating")
    }
    
    func run() {
        think()
        eat()
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}

//Creating Spoons and assigning them to developers
var spoons: [Spoon] = [Spoon(index: 1), Spoon(index: 2), Spoon(index: 3), Spoon(index: 4), Spoon(index: 5)]
var developers: [Developer] = [Developer(leftSpoon: spoons[0], rightSpoon: spoons[1]),
                               Developer(leftSpoon: spoons[1], rightSpoon: spoons[2]),
                               Developer(leftSpoon: spoons[2], rightSpoon: spoons[3]),
                               Developer(leftSpoon: spoons[3], rightSpoon: spoons[4]),
                               Developer(leftSpoon: spoons[4], rightSpoon: spoons[0])]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

print("Finished")
