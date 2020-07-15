import Foundation


class Spoon {
    private let locking = NSLock()
    private(set) var locked: Bool = false
    var index: Int

    func pickUp() {
        locking.lock()
        locked = true
        print("Picked Up")
    }

    func putDown() {
        locking.unlock()
        locked = false
        print("Put Down")
    }

    init(index: Int) {
        self.index = index
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon

    func think() {
        if leftSpoon.locked == false {
            leftSpoon.pickUp()
        }

        if rightSpoon.locked == false {
            rightSpoon.pickUp()
        }
        print("Thinking")
    }

    func eat() {
        usleep(3)
        if leftSpoon.locked == true {
            leftSpoon.putDown()
        }
        if rightSpoon.locked == true {
            rightSpoon.putDown()
        }
        print("Eating")
    }

    func run() {
        while true {
            think()
            eat()
        }
    }

    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}

var spoons: [Spoon] = [Spoon(index: 1), Spoon(index: 2), Spoon(index: 3), Spoon(index: 4), Spoon(index: 5)]

var developers: [Developer] = [Developer(leftSpoon: spoons[0], rightSpoon: spoons[1]),
                               Developer(leftSpoon: spoons[1], rightSpoon: spoons[2]),
                               Developer(leftSpoon: spoons[2], rightSpoon: spoons[3]),
                               Developer(leftSpoon: spoons[3], rightSpoon: spoons[4]),
                               Developer(leftSpoon: spoons[4], rightSpoon: spoons[0])]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

