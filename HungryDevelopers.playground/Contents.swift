import UIKit

class Spoon {
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
    
    private let spoonLock = NSLock()
}

class Developer {
    var devIndex: Int
    
    var hasLeftSpoon: Spoon
    var hasRightSpoon: Spoon
    
    init(leftHand: Spoon, rightHand: Spoon, devIndex: Int) {
        self.hasLeftSpoon = leftHand
        self.hasRightSpoon = rightHand
        self.devIndex = devIndex
    }
    
    func think() {
        hasLeftSpoon.pickUp()
        print("Dev \(devIndex): Picked up left spoon")
        hasRightSpoon.pickUp()
        print("Dev \(devIndex): Picked up right spoon")
        eat()
    }
    
    func eat() {
        let randomTime = Int.random(in: 1...100000)
        usleep(useconds_t(randomTime))
        
        print("Developer \(devIndex): is eating")
        
        hasLeftSpoon.putDown()
        print("Dev \(devIndex): put down left spoon")
        hasRightSpoon.putDown()
        print("Dev \(devIndex): put down right spoon")
        
        print("Developer \(devIndex): has finished eating")
    }
    
    func run() {
        think()
        run()
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let dev1 = Developer(leftHand: spoon1, rightHand: spoon2, devIndex: 1)
let dev2 = Developer(leftHand: spoon2, rightHand: spoon3, devIndex: 2)
let dev3 = Developer(leftHand: spoon3, rightHand: spoon4, devIndex: 3)
let dev4 = Developer(leftHand: spoon4, rightHand: spoon5, devIndex: 4)
let dev5 = Developer(leftHand: spoon5, rightHand: spoon1, devIndex: 5)

let devArray: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
devArray[$0].run()
}

