import UIKit

class Spoon {
    private var spoonLock = NSLock()
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        
    }
    
    func eat() {
        
    }
    
    func run() {
        
    }
}
