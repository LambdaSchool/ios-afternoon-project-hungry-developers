import UIKit

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
var numDevelopers = 5

class Spoon {
    let index: Int
    let lock = NSLock()
    init(_ index: Int) {
        self.index = index
    }
    
    func pickUp(developer: Developer) {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let index: Int
    var firstSpoon: Spoon?
    var secondSpoon: Spoon?
    var operation: BlockOperation!
    
    init(_ index: Int) {
        self.index = index
    }

    var leftSpoonIndex: Int {
        return index
    }

    var rightSpoonIndex: Int {
        return index == 0 ? numDevelopers - 1 : index - 1
    }

    func run() {

        print("Starting philosoper \(index)")

        while (true) {
            firstSpoon = spoons[min(leftSpoonIndex, rightSpoonIndex)]
            secondSpoon = spoons[max(leftSpoonIndex, rightSpoonIndex)]
            
            firstSpoon!.pickUp(developer: self)
            secondSpoon!.pickUp(developer: self)
            
            print("Developer \(index) eating with Spoon \(firstSpoon!.index) and \(secondSpoon!.index)")
            sleep(1)
            
            firstSpoon!.putDown()
            secondSpoon!.putDown()
        }
    }
}

var spoons = [Spoon]()
var developers = [Developer]()

for i in 0 ..< numDevelopers {
    spoons.append(Spoon(i))
    developers.append(Developer(i))
}

let queue = OperationQueue()

developers.forEach { developer in

    developer.operation = BlockOperation() {
        developer.run()
    }
    queue.addOperation(developer.operation)
}
