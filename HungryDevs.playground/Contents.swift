import UIKit

class Spoon {
    
    private var lock = NSLock()
    var index: Int

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
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
        
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        print("\(name) started eating")
        usleep(100)
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("\(name) has finished eating!")
    }
    
    func run() {
        
    }
}

// 5 Spoons
let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

// 5 Developers
let developer1 = Developer(name: "Carl", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "Mom", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "Dad", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "Sister", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "My Dog", leftSpoon: spoon5, rightSpoon: spoon1)

let developers = [developer1, developer2, developer3, developer4, developer5]


// Calling each developer in a different thread/queue
DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}



