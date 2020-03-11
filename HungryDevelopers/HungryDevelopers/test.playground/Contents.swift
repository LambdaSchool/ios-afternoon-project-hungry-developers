import UIKit



// MARK: - Spoon

class Spoon {
    
    // MARK: - Init
    init(index: Int) {
        self.index = index
    }
    // MARK: - Properties
    
    private var lock = NSLock()
    var index: Int

    
    // MARK: - Methods
    func pickUp() {
        lock.lock()
    }
    func putDown() {
        lock.unlock()
        }
    }

// MARK: - Developer
class Developer {
    
    //MARK: - INIT
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    // MARK: - Properties
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var count: Int = 0
    
    // MARK: - Methods
    func think() {
        let startTime = CACurrentMediaTime()
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        let endtime = CACurrentMediaTime()
        let difference = endtime - startTime
        print("\(self.name) thought for \(difference) seconds!")
        
        return
}
    func eat() {
        print("\(self.name) started eating.")
        sleep(5)
        
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("\(self.name) stopped eating!")
        count += 1
        print("\(name) ate for the \(count) time!")
        sleep(2)
      
        return
    }
    
    func run() {
        while true{
        think()
        eat()
        }
        
    }
    
}



let spoon1 = Spoon(index: 0)
let spoon2 = Spoon(index: 1)
let spoon3 = Spoon(index: 2)
let spoon4 = Spoon(index: 3)
let spoon5 = Spoon(index: 4)
let spoon6 = Spoon(index: 5)

let dev1 = Developer(leftSpoon: spoon6, rightSpoon: spoon1, name: "dev1")
let dev2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "dev2")
let dev3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "dev3")
let dev4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "dev4")
let dev5 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "dev5")
let dev6 = Developer(leftSpoon: spoon5, rightSpoon: spoon6, name: "dev6")

let developers = [dev1, dev2, dev3, dev4, dev5, dev6]

DispatchQueue.concurrentPerform(iterations: 6) {
    developers[$0].run()
}
























// MARK: - setup
/*
var spoons: [Spoon] = []
var developers: [Developer] = []

for i in 0..<5 {
    if i == 0 {
        let leftSpoon = Spoon(index: i + 1)
        let rightSpoon = Spoon(index: i + 2)
        let dev = Developer(leftSpoon: leftSpoon, rightSpoon: rightSpoon, name: String(i + 1))
        spoons.append(leftSpoon)
        spoons.append(rightSpoon)
        developers.append(dev)
    } else if i == 4 {
        let dev = Developer(leftSpoon: spoons[i - 1], rightSpoon: spoons[0], name: String(i + 1))
        developers.append(dev)
    } else {
        let rightSpoon = Spoon(index: i + 2)
        spoons.append(rightSpoon)
        let dev = Developer(leftSpoon: spoons[i-1], rightSpoon: rightSpoon, name: String(i + 1))
        developers.append(dev)
    }
}
*/
