import UIKit

class Spoon {
    private var spoonLock = NSLock()
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}

class Developer {
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
        }
    }
    
    func eat() {
        print("\(name) started eating")
        usleep(.random(in: 50...100))
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) finished eating")
    }
    
    func run() {
        while 1 == 1 {
            think()
            eat()
        }
    }
}

let spoons = [Spoon(index: 1),
              Spoon(index: 2),
              Spoon(index: 3),
              Spoon(index: 4),
              Spoon(index: 5)]

let developers = [Developer(name: "Hunter", leftSpoon: spoons[0], rightSpoon: spoons[1]),
                  Developer(name: "Spencer", leftSpoon: spoons[1], rightSpoon: spoons[2]),
                  Developer(name: "Kenny", leftSpoon: spoons[2], rightSpoon: spoons[3]),
                  Developer(name: "Harmony", leftSpoon: spoons[3], rightSpoon: spoons[4]),
                  Developer(name: "Joseph", leftSpoon: spoons[4], rightSpoon: spoons[0])]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
