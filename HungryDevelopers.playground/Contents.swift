import Foundation

var developers: [Developer] = []

class Spoon {
    
    let lock = NSLock()
    
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
    
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
    }
    
    func eat() {
        usleep(3)
        leftSpoon?.putDown()
        rightSpoon?.putDown()
    }
    
    func run() {
        think()
        eat()
    }
    
}

let developerOne = Developer()
let developerTwo = Developer()
let developerThree = Developer()
let developerFour = Developer()
let developerFive = Developer()

let spoonOne = Spoon()
let spoonTwo = Spoon()
let spoonThree = Spoon()
let spoonFour = Spoon()
let spoonFive = Spoon()

developerOne.leftSpoon = spoonFive
developerOne.rightSpoon = spoonOne

developerTwo.leftSpoon = spoonOne
developerTwo.rightSpoon = spoonTwo

developerThree.leftSpoon = spoonTwo
developerThree.rightSpoon = spoonThree

developerFour.leftSpoon = spoonThree
developerFour.rightSpoon = spoonFour

developerFive.leftSpoon = spoonFour
developerFive.rightSpoon = spoonFive


