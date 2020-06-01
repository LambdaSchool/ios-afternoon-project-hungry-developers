import UIKit

class Spoon {
    private var lock = NSLock()

    func pickUp() {
        lock.lock()
    }

    func putDown() {
        lock.unlock()
    }
}
