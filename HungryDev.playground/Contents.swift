import UIKit

var random = UInt32.random(in: 1...10)

class Spoon {
    var lock = NSLock()
    
    var index: Int

    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        self.lock.lock()
    }
    func putDown() {
        self.lock.unlock()
    }
}
let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
//let spoon5 = Spoon(index: 5)

let leftAndRight = DispatchQueue(label: "left and right dont matter")
class Devoloper {
    var left: Spoon
    var right: Spoon
    
    init(left: Spoon, right: Spoon) {
        self.left = left
        self.right = right
    }
    
    func think() {

        guard self.left.index < self.right.index else {
            leftAndRight.async {
                self.right.pickUp()
            }
            self.left.pickUp()
            return
        }
        
        leftAndRight.async {
            self.left.pickUp()
        }
        self.right.pickUp()
        print("pickup with \(self.left.index) and \(self.right.index)")
    }
    func eat() {
        usleep(random)
        self.left.putDown()
        self.right.putDown()
    }
    func run() {
        while true {
            think()
            eat()
        }
    }
}
let devoloper: [Devoloper] = [Devoloper(left: spoon1, right: spoon2),
                              Devoloper(left: spoon2, right: spoon3),
                              Devoloper(left: spoon3, right: spoon4),
                              Devoloper(left: spoon4, right: spoon1)]

DispatchQueue.concurrentPerform(iterations: 4) {
    devoloper[$0].run()
}
