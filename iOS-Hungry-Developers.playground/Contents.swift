import UIKit
import Foundation

class Spoon {
    let spoon = NSLock()
    var index = Int()

    func pickUp() {
        spoon.lock()
    }
    
    func putDown() {
        spoon.unlock()
    }
}

class Developer {
    var name: String?
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        
        if leftSpoon.index < rightSpoon.index {
            
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
    
        guard let name = name else { return }
        let startedEating = CACurrentMediaTime()
        sleep(1)
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        let finishedEating = CACurrentMediaTime()
        let elapsedTime = finishedEating - startedEating
        print("\(name) ate.")
    }
    
    func run() {
        think()
        eat()
    }
}

var spoonOne: Spoon = Spoon()
var spoonTwo: Spoon = Spoon()
var spoonThree: Spoon = Spoon()
var spoonFour: Spoon = Spoon()
var spoonFive: Spoon = Spoon()

spoonOne.index = 1
spoonTwo.index = 2
spoonThree.index = 3
spoonFour.index = 4
spoonFive.index = 5

let allSpoons: [Spoon] = [spoonOne,spoonTwo, spoonThree, spoonFour, spoonFive]

var developerOne: Developer = Developer()
var developerTwo: Developer = Developer()
var developerThree: Developer = Developer()
var developerFour: Developer = Developer()
var developerFive: Developer = Developer()

let allDevelopers: [Developer] = [developerOne, developerTwo, developerThree, developerFour, developerFive]

developerOne.name = "Developer One"
developerOne.leftSpoon = spoonOne
developerOne.rightSpoon = spoonTwo

developerTwo.name = "Developer Two"
developerTwo.leftSpoon = spoonTwo
developerTwo.rightSpoon = spoonThree

developerThree.name = "Developer Three"
developerThree.leftSpoon = spoonThree
developerThree.rightSpoon = spoonFour

developerFour.name = "Developer Four"
developerFour.leftSpoon = spoonFour
developerFour.rightSpoon = spoonFive

developerFive.name = "Developer Five"
developerFive.leftSpoon = spoonFive
developerFive.rightSpoon = spoonOne

DispatchQueue.concurrentPerform(iterations: 5) {
    allDevelopers[$0].run()
    
    print("Index \($0)")
}
