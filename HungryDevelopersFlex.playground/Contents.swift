import Foundation

class Spoon {
    let spoonLock = NSLock()

    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }

}

extension NSLock {
    func withLock(_ work: () -> Void) {
        lock()
        work()
        unlock()
    }
}

class Developer {
    
    let leftSpoon = Spoon()
    let rightSpoon = Spoon()
    
    func run() {
        func think() {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }
        
        func eat() {
            usleep(5)
        }
    }
}


