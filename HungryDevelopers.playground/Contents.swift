import Cocoa

class Spoon {
    
    let name: String
    let index: Int
    let lock = NSLock()
    var pickedUp: Bool = false
    weak var developer: Developer?
    
    init(name: String, index: Int) {
        self.name = name
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
        pickedUp = true
        print("\(name) picked up")
    }
    
    func putDown() {
        lock.unlock()
        pickedUp = false
        print("\(name) put down")
    }
}

class Developer {
    
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        //print("\(name) getting spoons")
        
        if Waiter.canIPickUpTheseSpoons(spoon1: leftSpoon, spoon2: rightSpoon) {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }
        
//        if leftSpoon.index < rightSpoon.index {
//            leftSpoon.pickUp()
//            print("\(name) picked up left spoon")
//        } else {
//            rightSpoon.pickUp()
//            print("\(name) picked up right spoon")
//        }
    }
    
    func eat() {
        print("\(name) starting eating")
        usleep(50)
        leftSpoon.putDown()
        rightSpoon.putDown()
        //print("\(name) finished eating")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

class Waiter {
    
    static func canIPickUpTheseSpoons(spoon1: Spoon, spoon2: Spoon) -> Bool {
        return !spoon1.pickedUp && !spoon2.pickedUp
    }
}

let spoon1 = Spoon(name: "spoon1", index: 1)
let spoon2 = Spoon(name: "spoon2", index: 2)
let spoon3 = Spoon(name: "spoon3", index: 3)
let spoon4 = Spoon(name: "spoon4", index: 4)
let spoon5 = Spoon(name: "spoon5", index: 5)

let dev1 = Developer(name: "dev1", leftSpoon: spoon1, rightSpoon: spoon2)
let dev2 = Developer(name: "dev2", leftSpoon: spoon2, rightSpoon: spoon3)
let dev3 = Developer(name: "dev3", leftSpoon: spoon3, rightSpoon: spoon4)
let dev4 = Developer(name: "dev4", leftSpoon: spoon4, rightSpoon: spoon5)
let dev5 = Developer(name: "dev5", leftSpoon: spoon5, rightSpoon: spoon1)

let developers = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
