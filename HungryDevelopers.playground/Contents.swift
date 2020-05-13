import UIKit

class Spoon {
    
    public let rank: Int
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
    
    private let spoonLock = NSLock()
    
    init(rank: Int) {
        self.rank = rank
    }
}

class Developer {
    var devIndex: Int
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(leftHand: Spoon, rightHand: Spoon, devIndex: Int) {
        self.leftSpoon = leftHand
        self.rightSpoon = rightHand
        self.devIndex = devIndex
    }
    
    func think() {
        
        if leftSpoon.rank < rightSpoon.rank {
            leftSpoon.pickUp()
            print("Dev \(devIndex): Picked up left spoon #\(leftSpoon.rank)")
            rightSpoon.pickUp()
            print("Dev \(devIndex): Picked up right spoon #\(rightSpoon.rank)")
            eat()
        } else {
            rightSpoon.pickUp()
            print("Dev \(devIndex): Picked up right spoon #\(rightSpoon.rank)")
        }
    }
    
    func eat() {
        let randomTime = Int.random(in: 1...100000)
        
        print("Developer \(devIndex): is eating")
        usleep(useconds_t(randomTime))
        print("Dev \(devIndex): Ate for \(randomTime) milli-secs")
        print("Developer \(devIndex): has finished eating")
        
        leftSpoon.putDown()
        print("Dev \(devIndex): put down left spoon #\(leftSpoon.rank)")
        rightSpoon.putDown()
        print("Dev \(devIndex): put down right spoon #\(rightSpoon.rank)")
        
        
    }
    
    func run() {
        think()
        run()
    }
}

let spoon1 = Spoon(rank: 1)
let spoon2 = Spoon(rank: 2)
let spoon3 = Spoon(rank: 3)
let spoon4 = Spoon(rank: 4)
let spoon5 = Spoon(rank: 5)

let dev1 = Developer(leftHand: spoon1, rightHand: spoon2, devIndex: 1)
let dev2 = Developer(leftHand: spoon2, rightHand: spoon3, devIndex: 2)
let dev3 = Developer(leftHand: spoon3, rightHand: spoon4, devIndex: 3)
let dev4 = Developer(leftHand: spoon4, rightHand: spoon5, devIndex: 4)
let dev5 = Developer(leftHand: spoon5, rightHand: spoon1, devIndex: 5)

let devArray: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    print($0)
    devArray[$0].run()
}

