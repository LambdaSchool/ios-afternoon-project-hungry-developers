import UIKit
import Foundation

class Spoon {
    
    let spoonLock = NSLock()
    var index = Int()
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
    
}

class Developer {
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    
    
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        let startedEating = CACurrentMediaTime()
        sleep(1)
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        let endedEating = CACurrentMediaTime()
        let elapsedTime = endedEating - startedEating
        print("Time spent eating: \(elapsedTime)")
    }
    
    func run() {
        think()
        eat()

    }
    
    
    
    
}

var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

spoon1.index = 1
spoon2.index = 2
spoon3.index = 3
spoon4.index = 4
spoon5.index = 5
    
let spoons: [Spoon] = [spoon1,spoon2,spoon3,spoon4,spoon5]

let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

let developers: [Developer] = [developer1,developer2,developer3,developer4,developer5]
    
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

let sharedAccessQueue = DispatchQueue(label: "Shared Resource Queue")

DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
}

