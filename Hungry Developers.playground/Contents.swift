import UIKit

class Spoon {
    
    private let lock = NSLock()
    
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
        leftSpoon.pickUp()
        rightSpoon.putDown()
        return
    }
    
    func eat() {
        usleep(1000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        return
    }
    
    func run() {
        think()
        eat()
    }
}
