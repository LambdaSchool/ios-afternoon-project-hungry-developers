import UIKit

class Spoon {
    
    private var lock = NSLock()
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
        
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    let name: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        
    }
    
    func eat() {
        print("Developer \(name) STARTED eating")
        sleep(4)
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("Developer \(name) STOPPED eating")
        
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
}

var spoons: [Spoon] = []
var developers: [Developer] = []

for i in 0..<5 {
    if i == 0 {
        let leftSpoon = Spoon(index: i + 1)
        let rightSpoon = Spoon(index: i + 2)
        let developer = Developer(leftSpoon: leftSpoon, rightSpoon: rightSpoon, name: String(i + 1))
        spoons.append(leftSpoon)
        spoons.append(rightSpoon)
        developers.append(developer)
    } else if i == 4 {
        let developer = Developer(leftSpoon: spoons[i - 1], rightSpoon: spoons[0], name: String(i + 1))
        developers.append(developer)
    } else {
        let rightSpoon = Spoon(index: i + 2)
        let developer = Developer(leftSpoon: spoons[i - 1], rightSpoon: rightSpoon, name: String(i + 1))
        spoons.append(rightSpoon)
        developers.append(developer)
    }
}

//print(spoons.count)
//print(developers.count)
//for spoon in spoons {
//    print(spoon.index)
//}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

