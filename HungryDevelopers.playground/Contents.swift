import Foundation

//MARK: - Properties and Classes

class Spoon {
    private var lock = NSLock()
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
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        usleep(5)
    }
    
    func run() {
        think()
        eat()
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}

//Creating Spoons and assigning them to developers
var spoons: [Spoon] = [Spoon(), Spoon(), Spoon(), Spoon(), Spoon()]

var developers: [Developer] = [Developer(leftSpoon: spoons[0], rightSpoon: spoons[1]),
                               Developer(leftSpoon: spoons[1], rightSpoon: spoons[2]),
                               Developer(leftSpoon: spoons[2], rightSpoon: spoons[3]),
                               Developer(leftSpoon: spoons[3], rightSpoon: spoons[4]),
                               Developer(leftSpoon: spoons[4], rightSpoon: spoons[1])]
