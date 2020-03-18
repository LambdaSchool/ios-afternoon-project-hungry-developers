import UIKit
// 1. Create a class called Spoon. It should have two methods, pickUp() and putDown().
class Spoon {
// 2. If pickUp() is called while the spoon is in use by another developer, pickUp() should wait until the other developer calls putDown(). You can implement this with a private lock property.
    let spoonLock = NSLock()
    var index = Int()
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}
