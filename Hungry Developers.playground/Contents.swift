import UIKit


class Spoon {
    let lock = NSLock()
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        print("pickUp Locked")
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
        print("putDown Unlocked")
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
    
    func eat() {
        usleep(500)
        rightSpoon.putDown()
        print("\(name) has put Right spoon down")
        leftSpoon.putDown()
        print("\(name) has put Left spoon down")
        
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(name) picked up Left Spoon then right")
            rightSpoon.pickUp()
            print("\(name) picked up Right Spoon")
            usleep(500)
        } else {
            rightSpoon.pickUp()
            print("\(name) picked up Right Spoon then left")
            leftSpoon.pickUp()
            print("\(name) picked up Left Spoon")
            usleep(500)
        }
        return
    }
    
    func run() {
        think()
        eat()
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

var developers: [Developer] = []

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Dev 1")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Dev 2")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Dev 3")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Dev 4")

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
