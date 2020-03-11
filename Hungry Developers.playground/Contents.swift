import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var numberOfDevelopers = 5

class Spoon {
    let lock = NSLock()
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
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    var leftSpoonIndex: Int {
        return index
    }
    
    var rightSpoonIndex: Int {
        return index == 0 ? numberOfDevelopers - 1 : index - 1
    }
    
    func think() {
        leftSpoon = spoons[min(leftSpoonIndex, rightSpoonIndex)]
        rightSpoon = spoons[max(leftSpoonIndex, rightSpoonIndex)]
        
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        
    }
    
    func eat() {
        usleep(2)
        
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    
    func run() {
        while (true) {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []
var developers: [Developer] = []

for index in 0..<numberOfDevelopers {
    spoons.append(Spoon(index: index))
    developers.append(Developer(index: index))
}

DispatchQueue.concurrentPerform(iterations: numberOfDevelopers) {
    developers[$0].run()
}
