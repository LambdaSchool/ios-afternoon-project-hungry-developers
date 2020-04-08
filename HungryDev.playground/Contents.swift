import Cocoa

class Spoon {
    var lock = NSLock()
    var locked = false
    func pickUp() {
        lock.lock()
        locked = true
    }
    
    func putDown() {
        lock.unlock()
        locked = false
    }
}

class Developer {
    var leftSpoon: Spoon {
        didSet {
            print("someone got the left")
        }
    }
    var rightSpoon: Spoon {
           didSet {
              print("someone got the left")
           }
       }
    
    var holdingLeft = false
    var holdingRight = false
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        print("think pickUp")
        /*
        repeat {
            print("think pickUp")
        } while leftSpoon.locked && rightSpoon.locked
        */
        
        eat()
    }
    
    func eat() {
        sleep(3)
       // usleep(5)
        print("eating for 5 seconds")
        rightSpoon.putDown()
        leftSpoon.putDown()
        think()
    }
    
    func run() {
        print("it's running now")
        think()
        eat()
    }
    
}

var nwSpoon = Spoon()
var neSpoon = Spoon()
var wSpoon = Spoon()
var eSpoon = Spoon()
var sSpoon = Spoon()

var nDev = Developer(leftSpoon: neSpoon, rightSpoon: nwSpoon)
var wDev = Developer(leftSpoon: nwSpoon, rightSpoon: wSpoon)
var swDev = Developer(leftSpoon: wSpoon, rightSpoon: sSpoon)
var seDev = Developer(leftSpoon: sSpoon, rightSpoon: eSpoon)
var eDev = Developer(leftSpoon: eSpoon, rightSpoon: neSpoon)

var developers = [nDev, wDev, swDev, seDev, eDev]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
