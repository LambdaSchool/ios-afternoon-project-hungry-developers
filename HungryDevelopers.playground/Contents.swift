import UIKit

class Spoon {

    let lock = NSLock()

    func pickUp() {
        lock.lock()

        lock.unlock()

    }

    func putDown() {
        lock.lock()

        lock.unlock()
    }
}
