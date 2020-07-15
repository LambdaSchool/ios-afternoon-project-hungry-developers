import UIKit


class Spoon {
    let lock = NSLock()
    var index = Int()

    func pickUp() {
        lock.lock()
    }

    func putDown() {
        lock.unlock()
    }

}

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var name: String?

    func think() {
        print("thinking")
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
      //  eat()
    }

    func eat() {
        print("\(String(describing: name)) started eating")
        usleep(UInt32.random(in: 1...10))
        leftSpoon?.putDown()
        rightSpoon?.putDown()
        print("\(String(describing: name)) stoped eating")
        //think()
    }

    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()
spoon1.index = 1
spoon2.index = 2
spoon3.index = 3
spoon4.index = 4
spoon5.index = 5


let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()
developer1.name = "Developer 1"
developer1.rightSpoon = spoon1
developer1.leftSpoon = spoon2

developer2.name = "Developer 2"
developer2.rightSpoon = spoon2
developer2.leftSpoon = spoon3

developer3.name = "Developer 3"
developer3.rightSpoon = spoon3
developer3.leftSpoon = spoon4

developer4.name = "Developer 4"
developer4.rightSpoon = spoon4
developer4.leftSpoon = spoon1
/*
developer5.name = "Developer 5"
developer5.rightSpoon = spoon5
developer5.leftSpoon = spoon1
 */


var developers: [Developer] = [developer1, developer2, developer3, developer4]

DispatchQueue.concurrentPerform(iterations: 4) {
developers[$0].run()
}
