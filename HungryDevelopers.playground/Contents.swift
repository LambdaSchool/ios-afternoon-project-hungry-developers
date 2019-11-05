import UIKit

class Spoon {
    
    let spoonLock = NSLock()
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
    
}

class Developer {
    
    var leftSpoon: Spoon? = nil
    var rightSpoon: Spoon? = nil
    
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
    }
    
    func eat() {
        sleep(5)
        rightSpoon?.putDown()
        leftSpoon?.putDown()
    }
    
    func run() {
        think()
        eat()
    }
    
}

let spoon1: Spoon 
let spoon2: Spoon
let spoon3: Spoon
let spoon4: Spoon
let spoon5: Spoon
    
let spoons: [Spoon] = [spoon1,spoon2,spoon3,spoon4,spoon5]

let developer1: Developer
let developer2: Developer
let developer3: Developer
let developer4: Developer
let developer5: Developer

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

