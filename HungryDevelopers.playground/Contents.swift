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
