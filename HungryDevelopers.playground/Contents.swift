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

//3. Create a class called Developer. Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func run() {
        // 4. Developer.run() should call think() then eat() over and over again forever.
        think()
        eat()
    }
    func think() {
        //5. think() should pick up both spoons before returning.
        print("Thinking")
        guard let ls = leftSpoon, let rs = rightSpoon else { return }
        
        if ls.index < rs.index {
            ls.pickUp()
            rs.pickUp()
        } else {
            rs.pickUp()
            ls.pickUp()
        }
    }
    
    func eat() {
        //6. eat() should pause for a random amount of time before putting both spoons down.
        print("Eating")
        usleep(10000) // (Hint: use usleep() to pause for a given number of microseconds).
        leftSpoon?.putDown()
        rightSpoon?.putDown()
        
    }
}
