import UIKit

class Spoon {
    var index: Int = 0
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    var name: String?
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        let group = DispatchGroup()
        let avenueQueue = DispatchQueue(label: "Avenue Queue")
        
        if let leftIndex = leftSpoon?.index,
            let rightIndex = rightSpoon?.index {
            if leftIndex < rightIndex {
                group.enter()
                avenueQueue.async {
                    self.leftSpoon?.pickUp()
                    print("\(self.name ?? "") picked up left spoon.")
                    group.leave()
                }
                group.wait()
                group.enter()
                avenueQueue.async {
                    self.rightSpoon?.pickUp()
                    print("\(self.name ?? "") picked up right spoon.")
                    group.leave()
                }
                group.wait()
            } else {
                group.enter()
                avenueQueue.async {
                    self.rightSpoon?.pickUp()
                    print("\(self.name ?? "") picked up right spoon.")
                    group.leave()
                }
                group.wait()
                group.enter()
                avenueQueue.async {
                    self.leftSpoon?.pickUp()
                    print("\(self.name ?? "") picked up left spoon.")
                    group.leave()
                }
                group.wait()
            }
        }
    }
    
    func eat() {
        usleep(useconds_t(Int.random(in: 1...20)))
        rightSpoon?.putDown()
        leftSpoon?.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoonA = Spoon()
spoonA.index = 1

let spoonB = Spoon()
spoonB.index = 2

let spoonC = Spoon()
spoonC.index = 3

let spoonD = Spoon()
spoonD.index = 4

let spoonE = Spoon()
spoonE.index = 5

var devOne = Developer()
devOne.name = "DevOne"
devOne.leftSpoon = spoonA
devOne.rightSpoon = spoonB

var devTwo = Developer()
devTwo.name = "DevTwo"
devTwo.leftSpoon = spoonB
devTwo.rightSpoon = spoonC

var devThree = Developer()
devThree.name = "DevThree"
devThree.leftSpoon = spoonC
devThree.rightSpoon = spoonD

var devFour = Developer()
devFour.name = "DevFour"
devFour.leftSpoon = spoonD
devFour.rightSpoon = spoonE

var devFive = Developer()
devFive.name = "DevFive"
devFive.leftSpoon = spoonE
devFive.rightSpoon = spoonA

var developers: [Developer] = [devOne, devTwo, devThree, devFour, devFive]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
