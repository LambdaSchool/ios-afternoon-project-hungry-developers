import UIKit

class Spoon {
    
    func pickUp() {
        semaphoreSpoon.wait()
    }
    
    func putDown() {
        semaphoreSpoon.signal()
    }
    
    private let semaphoreSpoon = DispatchSemaphore(value: 0)
}

class Developer {
    var hasLeftSpoon: Spoon
    var hasRightSpoon: Spoon
    
    init(leftHand: Spoon, rightHand: Spoon) {
        self.hasLeftSpoon = leftHand
        self.hasRightSpoon = rightHand
    }
    
    func think() {
        hasLeftSpoon.pickUp()
        "Picked up left spoon"
        hasRightSpoon.pickUp()
        "Picked up right spoon"
    }
    
    func eat() {
        let randomTime = Int.random(in: 1...5)
        usleep(useconds_t(randomTime))
        
        print("Developer is eating")
        
        hasLeftSpoon.putDown()
        hasRightSpoon.putDown()
    }
    
    func run() {
        think()
        eat()
        run()
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let dev1 = Developer(leftHand: spoon1, rightHand: spoon2)
let dev2 = Developer(leftHand: spoon2, rightHand: spoon3)
let dev3 = Developer(leftHand: spoon3, rightHand: spoon4)
let dev4 = Developer(leftHand: spoon4, rightHand: spoon5)
let dev5 = Developer(leftHand: spoon5, rightHand: spoon1)

let devArray: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
devArray[$0].run()
}

