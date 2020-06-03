import Foundation

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

    let name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon

    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }

    func think() {
        print("\(name) is thinking about picking up their spoons!")
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        print("\(name) picked up spoon \(leftSpoon.index) and spoon \(rightSpoon.index)!")
        return
    }

    func eat() {

        sleep(1)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) is done eating!")
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

let developer1 = Developer(name: "Chris", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "Tommy", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "Ariana", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "Jessica", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "David", leftSpoon: spoon5, rightSpoon: spoon1)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
