import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var numDev = 5

class Spoon {
    let index: Int
    private let lock = NSLock()
    
    init(_ index: Int) {
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
    
    let index: Int
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(_ index: Int) {
        self.index = index
    }
    
    var leftSpoonIndex: Int {
        return index
    }
    
    var rightSpoonIndex: Int {
        return index == 0 ? numDev - 1 : index - 1
    }
    
    func think() {
        guard var leftSpoon = leftSpoon, var rightSpoon = rightSpoon else { return }
        
        leftSpoon = spoons[min(leftSpoonIndex, rightSpoonIndex)]
        rightSpoon = spoons[max(leftSpoonIndex, rightSpoonIndex)]
        
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        
    }
    
    func eat() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        sleep(2)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        
        while (true) {
            self.think()
            self.eat()
        }
    }
}

var spoons = [Spoon]()
var developers = [Developer]()

for i in 0 ..< numDev {
    spoons.append(Spoon(i))
    developers.append(Developer(i))
}

DispatchQueue.concurrentPerform(iterations: numDev) {
    developers[$0].run()
}

//let spoon1 = Spoon()
//let spoon2 = Spoon()
//let spoon3 = Spoon()
//let spoon4 = Spoon()
//let spoon5 = Spoon()

//let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
//let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
//let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
//let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
//let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)


//DispatchQueue.concurrentPerform(iterations: 5) {
//    developers[$0].run()
//}
