import Foundation

class Spoon {
    let lock = NSLock()
    var isPickedUp: Bool = false
    var index: Int = 0

    func pickUp() {
        while isPickedUp { continue }
        lock.lock()
        isPickedUp = true
        lock.unlock()
    }

    func putDown() {
        lock.lock()
        isPickedUp = false
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
    let devName: String

    func think() {
        print("\(devName) is thinking about eating...")

        if rightSpoon.index > leftSpoon.index {

        sleep(randomTime)

        leftSpoon.pickUp()
        print("\(devName) has picked up their left spoon \(leftSpoon.index).")

        rightSpoon.pickUp()
        print("\(devName) has picked up their right spoon \(rightSpoon.index).")

        } else {
            rightSpoon.pickUp()
            print("\(devName) has picked up their right spoon \(rightSpoon.index).")
            leftSpoon.pickUp()
            print("\(devName) has picked up their left spoon \(leftSpoon.index).")
        }
        return
    }

    func eat() {
        print("\(devName) is eating.  Me hungry!")

        sleep(randomTime)
        leftSpoon.putDown()
        print("\(devName) put down their left spoon \(leftSpoon.index).")

        rightSpoon.putDown()
        print("\(devName) put down their right spoon \(rightSpoon.index).")
    }

    func run() {
        while true {
            think()
            eat()
        }
    }

    init(leftSpoon: Spoon, rightSpoon: Spoon, devName: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.devName = devName
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, devName: "A")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, devName: "B")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, devName: "C")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, devName: "D")
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, devName: "E")
let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}





