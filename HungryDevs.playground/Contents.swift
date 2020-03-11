import UIKit
import Foundation

class Spoon {
    
    let lock = NSLock()
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
   }
    
    func putDown() {
        lock.unlock()
   }
}

var spoons: [Spoon] = []
let s1 = Spoon(index: 1)
let s2 = Spoon(index: 2)
let s3 = Spoon(index: 3)
let s4 = Spoon(index: 4)
let s5 = Spoon(index: 5)

extension NSLock {
    func changeLock(_ work: () -> Void) {
        lock()
        work()
        unlock()
    }
}

class Developer {
    var LSpoon: Spoon
    var RSpoon: Spoon
    
    init(LSpoon: Spoon, RSpoon: Spoon) {
        self.LSpoon = LSpoon
        self.RSpoon = RSpoon
    }
    
    func think() {
        if RSpoon.index < LSpoon.index {
            RSpoon.pickUp()
            LSpoon.pickUp()
        } else {
            LSpoon.pickUp()
            RSpoon.pickUp()
        }
        eat()
        return
    }
    
    func eat() {
        usleep(1000)
        RSpoon.putDown()
        LSpoon.putDown()
        return
    }
    
    func run(_ name: String) {
        think()
        eat()
        print(name)
        run(name)
    }
}
    let d1 = Developer(LSpoon: s1, RSpoon: s5)
    let d2 = Developer(LSpoon: s2, RSpoon: s1)
    let d3 = Developer(LSpoon: s3, RSpoon: s2)
    let d4 = Developer(LSpoon: s4, RSpoon: s3)
    let d5 = Developer(LSpoon: s5, RSpoon: s4)
    let developers = [d1, d2, d3, d4, d5]

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run($0.description) }
