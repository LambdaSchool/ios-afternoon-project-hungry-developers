import Foundation

// 1. Create a class called Spoon. It should have two methods, pickUp() and putDown().
class Spoon {
    init(id: Int) {
        self.id = id
    }
    // 2. If pickUp() is called while the spoon is in use by another developer, pickUp() should wait until the other developer calls putDown(). You can implement this with a private lock property.
    private let lock = NSLock()
    let id: Int
    
    func pickUp() {
        lock.lock()
    }
    func putDown() {
        lock.unlock()
    }
}

// 3. Create a class called Developer. Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
class Developer {
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    
    func run() {
        // 4. Developer.run() should call think() then eat() over and over again forever.
        while true {
            think()
            eat()
        }
    }
    
    func think() {
        // 5. think() should pick up both spoons before returning.
        print("\(name) is waiting to pickup his spoons")
        leftSpoon.pickUp()
        print("\(name) picked up the left spoon \(leftSpoon.id)")
        rightSpoon.pickUp()
        print("\(name) picked up the right spoon \(rightSpoon.id)")
    }
    
    func eat() {
        // 6. eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
        print("\(name) is eating")
        usleep(UInt32.random(in: 1...100))
        leftSpoon.putDown()
        print("\(name) put down the left spoon \(leftSpoon.id)")
        rightSpoon.putDown()
        print("\(name) put down the right spoon \(rightSpoon.id)")
    }
    
}

// 7. Create 5 Spoons and 5 Developers giving each developer a left and right spoon. Note that developers will of course share spoons. Every developer's right spoon is the next developer's left spoon.
var spoons: [Spoon] = []
for i in 1...5 {
    spoons.append(Spoon(id: i))
}

var developerNames = ["One", "Two", "Three", "Four", "Five"]
var developers: [Developer] = []
for i in 0...4 {
    developers.append(Developer(leftSpoon: spoons[i], rightSpoon: spoons[(i + 1) % spoons.count], name: developerNames[i]))
}

// 8. Call run() on each developer in a different queue/thread. You can do this with the following code assuming you put your developers in an array:
DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
