import Cocoa

// MARK: - Part One

// Create a class called Spoon. It should have two methods, pickUp() and putDown().
class Spoon {
    let lock = NSLock()
    var index = Int()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.lock()
    }
}

/* Create a class called Developer. It should have a leftSpoon and rightSpoon property. Also a think(), eat(), and run() method. */
class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        print("Begin eating")
        usleep(UInt32.random(in: 1000...10_000_000))
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        print("Stop eating")
    }
    
    func run() {
        think()
        eat()
    }
}

// Create 5 Spoons and 5 Developers
var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

var developer1 = Developer()
var developer2 = Developer()
var developer3 = Developer()
var developer4 = Developer()
var developer5 = Developer()
