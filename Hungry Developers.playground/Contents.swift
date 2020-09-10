import UIKit

class Spoon {

    let xLock = NSLock()
    var isHeld = true
    var id: Int

    func pickUP() {
        isHeld = false
        xLock.lock()
        print("\(self.id) was pickUp")
    }

    func putDown() {
        isHeld = true
        xLock.unlock()
        print("\(self.id) was putDown")
    }

    init(id: Int) {
        self.id = id
    }
}


class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon

    func think() {
        if leftSpoon.id < rightSpoon.id {
            leftSpoon.pickUP()
            rightSpoon.pickUP()
        } else {
            rightSpoon.pickUP()
            leftSpoon.pickUP()
        }
//        if leftSpoon.isHeld {
//            leftSpoon.pickUP()
//            rightSpoon.pickUP()
//        } else {
//            rightSpoon.pickUP()
//            leftSpoon.pickUP()
//        }
    }

    func eat() {
        usleep(500_000)
        leftSpoon.putDown()
        rightSpoon.putDown()
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

let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)
let spoon5 = Spoon(id: 5)

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

let allDevelopers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    allDevelopers[$0].run()
}

//           MARK: - Developer 1
//         dev1.leftSpoon = spoon1
//         dev1.rightSpoon = spoon2
//           MARK: - Developer 2
//         dev2.leftSpoon = spoon2
//         dev2.rightSpoon = spoon3
//           MARK: - Developer 3
//         dev3.leftSpoon = spoon3
//         dev3.rightSpoon = spoon4
//           MARK: - Developer 4
//         dev4.leftSpoon = spoon4
//         dev4.rightSpoon = spoon5
//           MARK: - Developer 5
//         dev5.leftSpoon = spoon5
//         dev5.rightSpoon = spoon1
