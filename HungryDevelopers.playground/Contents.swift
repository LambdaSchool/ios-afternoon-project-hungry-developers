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
        print("Done thinking")
        return
    }
    
    func eat() {
        //6. eat() should pause for a random amount of time before putting both spoons down.
        print("Eating")
        usleep(10000) // (Hint: use usleep() to pause for a given number of microseconds).
        leftSpoon?.putDown()
        rightSpoon?.putDown()
        print("Done eating")
        return
    }
}

//7.Create 5 Spoons and 5 Developers giving each developer a left and right spoon.
var spoon1 = Spoon(), spoon2 = Spoon(), spoon3 = Spoon(), spoon4 = Spoon(), spoon5 = Spoon()

spoon1.index = 1
spoon2.index = 2
spoon3.index = 3
spoon4.index = 4
spoon5.index = 5

let developer1 = Developer(), developer2 = Developer(), developer3 = Developer(), developer4 = Developer(), developer5 = Developer()

//8. Call run() on each developer in a different queue/thread.
var hungryDevelopers: [Developer] = []
hungryDevelopers.append(contentsOf: [developer1,developer2,developer3,developer4,developer5])

developer1.leftSpoon = spoon1
developer1.rightSpoon = spoon2

developer2.leftSpoon = spoon2
developer2.rightSpoon = spoon3

developer3.leftSpoon = spoon3
developer3.rightSpoon = spoon4

developer4.leftSpoon = spoon4
developer4.rightSpoon = spoon5

developer5.leftSpoon = spoon5
developer5.rightSpoon = spoon1

DispatchQueue.concurrentPerform(iterations: 5) { hungryDevelopers[$0].run() }

