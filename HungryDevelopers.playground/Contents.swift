import UIKit

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


class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else {return}
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    
    
