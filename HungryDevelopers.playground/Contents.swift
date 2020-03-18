import UIKit
import Foundation

class Spoon {
    
    var lock = NSLock()
    func pickUp() {
        ///If pickUp() is called while the spoon is in use by another developer, pickUp() should wait until the other developer calls putDown(). You can implement this with a private lock property.
    }
    
    func putDown() {
        
    }
    
}

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        ///think() should pick up both spoons before returning.
    }
    
    func eat() {
        ///eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
    }
    
    func run() {
        ///Developer.run() should call think() then eat() over and over again forever.
    }
}

///Create 5 Spoons and 5 Developers giving each developer a left and right spoon. Note that developers will of course share spoons. Every developer's right spoon is the next developer's left spoon.
var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

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


///Call run() on each developer in a different queue/thread. You can do this with the following code assuming you put your developers in an array:

var developers: [Developer] = []
developers.append(contentsOf: [developer1, developer2, developer3, developer4, developer5])

DispatchQueue.concurrentPerform(iterations: 5) { developers[$0].run() }
