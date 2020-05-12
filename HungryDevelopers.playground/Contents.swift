import UIKit

class Spoon {
    func pickUp() {
        lock.lock()
        putDown()
    }
    
    func putDown() {
        
        lock.unlock()
    }
    
    private let lock = NSLock()
}

class Developer {
    var leftSpoon: Bool
    var rightSpoon: Bool
    
    func think() {
        Spoon.pickUp(Spoon.init())
    }
    
    func eat() {
        
    }
    
    func run() {
        think()
        eat()
        run()
    }
    
    init(leftSpoon: Bool, rightSpoon: Bool) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}
