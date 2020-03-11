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
    
}
