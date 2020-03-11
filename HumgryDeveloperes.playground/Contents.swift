import UIKit

var str = "Hello, playground"


class Spoon {
    
    private var lock = NSLock()
    
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
}

class Developer {
    var leftSpoon = Spoon()
    var rightSpoon = Spoon()
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        usleep(UInt32.random(in: 1...3))
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

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let dev1 = Developer(leftSpoon: spoon1,
                     rightSpoon: spoon2)
let dev2 = Developer(leftSpoon: spoon2,
                     rightSpoon: spoon3)
let dev3 = Developer(leftSpoon: spoon3,
                     rightSpoon: spoon4)
let dev4 = Developer(leftSpoon: spoon4,
                     rightSpoon: spoon5)
let dev5 = Developer(leftSpoon: spoon5,
                     rightSpoon: spoon1)
