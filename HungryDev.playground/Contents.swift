import Cocoa


class Spoon {
    private let lock = NSLock()
 //   var locked = false
    func pickUp() {
        print("attemping pickup")
        lock.lock()
        print("successful pickup")
//        locked = true
    }
    
    func putDown() {
        print("attemping putdown")
        lock.unlock()
        print("successful putdown")
//        locked = false
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var id: String
    var number: UInt32 = 0
    
//    var holdingLeft = false
//    var holdingRight = false
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, identifier: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = identifier
    }
    
    func think() {
        print("attempting left pickup  \(id)")
        leftSpoon.pickUp()
        print("leftspoon pickup  \(id)")
        print("attempting right pickup  \(id)")
        rightSpoon.pickUp()
        print("rightspoon pickUp  \(id)")
        
        eat()
    }
    
    func eat() {
        print("sleeping for 5 miliseconds  \(id)")
        usleep(5)
        print("finished eating  \(id)")
        rightSpoon.putDown()
        print("rightspoon putDown  \(id)")
        leftSpoon.putDown()
        print("leftspoon putDown  \(id)")
        think()
    }
    
    func run() {
        print("it's running now")
        usleep(number)
        think()
        eat()
    }
    
}

var nwSpoon = Spoon()
var neSpoon = Spoon()
var wSpoon = Spoon()
//var eSpoon = Spoon()
var sSpoon = Spoon()

var nDev = Developer(leftSpoon: neSpoon, rightSpoon: nwSpoon, identifier: "NORTH")
var wDev = Developer(leftSpoon: nwSpoon, rightSpoon: wSpoon, identifier: "WEST")
var swDev = Developer(leftSpoon: wSpoon, rightSpoon: sSpoon, identifier: "SW")
var seDev = Developer(leftSpoon: sSpoon, rightSpoon: neSpoon, identifier: "SE")
//var eDev = Developer(leftSpoon: eSpoon, rightSpoon: neSpoon, identifier: "EAST")

var developers = [nDev, wDev, swDev, seDev] //, eDev]

for i in 0..<developers.count {
    developers[i].number = UInt32(i)
}

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
