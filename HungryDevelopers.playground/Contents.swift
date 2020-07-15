import UIKit

class Spoon {
    
    private var lock = NSLock()
    
    var id: Int
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    init(id: Int) {
        self.id = id
    }
    
}

class Developer {
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    func think() {
        if leftSpoon.id > rightSpoon.id {
            leftSpoon.pickUp()
            print("\(self.name) picked up their left spoon")
            rightSpoon.pickUp()
            print("\(self.name) picked up their right spoon")
        } else {
            rightSpoon.pickUp()
            print("\(self.name) picked up their right spoon")
            leftSpoon.pickUp()
            print("\(self.name) picked up their left spoon")
        }
        
    }
    
    func eat() {
        usleep(useconds_t(Int.random(in: 250000...1000000)))
        print("\(self.name) ate some soup.")
        leftSpoon.putDown()
        print("\(self.name) put down their left spoon")
        rightSpoon.putDown()
        print("\(self.name) put down their right spoon")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
}

// Cleaning the spoons
var spoon1 = Spoon(id: 1)
var spoon2 = Spoon(id: 2)
var spoon3 = Spoon(id: 3)
var spoon4 = Spoon(id: 4)
var spoon5 = Spoon(id: 5)

// Seating the developers
var developerClay = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Clay")
var developerFernando = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Fernando")
var developerBronson = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Bronson")
var developerJosh = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Josh")
var developerChristopher = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Christopher")

var developers: [Developer] = [developerClay,
                               developerFernando,
                               developerBronson,
                               developerJosh,
                               developerChristopher]

print("----------------------------")
print("+ Welcome to Olive Garden! +")
print("----------------------------\n")

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

NSLog("Error: Program stopped.")
