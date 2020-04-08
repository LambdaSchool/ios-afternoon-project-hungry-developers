import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Spoon {
    private let spoonLock = NSLock()

    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    let pairOfSpoons = 2
    let spoonsGroup = DispatchGroup()
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        for _ in 0..<pairOfSpoons {
            spoonsGroup.enter()
            leftSpoon.pickUp()
            rightSpoon.pickUp()
            spoonsGroup.leave()
        }
        
        spoonsGroup.wait()
    }
    
    func eat() {
        usleep(100_000)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        think()
        eat()
    }
}
