import Cocoa

// MARK: - Part One

// Create a class called Spoon. It should have two methods, pickUp() and putDown().
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

/* Create a class called Developer. It should have a leftSpoon and rightSpoon property. Also a think(), eat(), and run() method. */
class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        
    }
    
    func eat() {
        
    }
    
    func run() {
        
    }
}

