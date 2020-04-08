import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Spoon {
    private let spoonLock = NSLock()
    private(set) var index: Int
    
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
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    var count: Int = 0
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        let startTime = CACurrentMediaTime()
        
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        
        let endTime = CACurrentMediaTime()
        let duration = endTime - startTime
        
        print("\(name) thought for \(duration) seconds")
        return
    }
    
    func eat() {
        usleep(100_000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        count += 1
        print("\(name) has eaten \(count) times")
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let developer1 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Developer 1")
let developer2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Developer 2")
let developer3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Developer 3")
let developer4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Developer 4")
let developer5 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Developer 5")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
