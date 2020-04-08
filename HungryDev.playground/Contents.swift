import Cocoa


class Spoon {
    var index: Int
    private let lock = NSLock()
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        print("attemping pickup")
        lock.lock()
        print("successful pickup")
    }
    
    func putDown() {
        print("attemping putdown")
        lock.unlock()
        print("successful putdown")
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var id: String
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, identifier: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = identifier
    }
    
    func think() {
        
        if leftSpoon.index < rightSpoon.index {
            print("attempting left pickup  \(id)")
            leftSpoon.pickUp()
            print("leftspoon pickup  \(id)")
            print("attempting right pickup  \(id)")
            rightSpoon.pickUp()
            print("rightspoon pickUp  \(id)")
        } else {
            print("attempting right pickup  \(id)")
            rightSpoon.pickUp()
            print("rightspoon pickUp  \(id)")
            print("attempting left pickup  \(id)")
            leftSpoon.pickUp()
            print("leftspoon pickup  \(id)")
        }
        
        eat()
    }
    
    func eat() {
        print("sleeping for some miliseconds  \(id)")
        usleep(useconds_t(Int.random(in: 1...1000000)))
        print("finished eating  \(id)")
        rightSpoon.putDown()
        print("rightspoon putDown  \(id)")
        leftSpoon.putDown()
        print("leftspoon putDown  \(id)")
        think()
    }
    
    func run() {
        print("it's running now")
        usleep(useconds_t(Int.random(in: 1...1000000)))
        think()
        eat()
    }
    
}

var nwSpoon = Spoon(index: 1)
var neSpoon = Spoon(index: 2)
var wSpoon = Spoon(index: 3)
var sSpoon = Spoon(index: 4)

var nDev = Developer(leftSpoon: neSpoon, rightSpoon: nwSpoon, identifier: "NORTH")
var wDev = Developer(leftSpoon: nwSpoon, rightSpoon: wSpoon, identifier: "WEST")
var swDev = Developer(leftSpoon: wSpoon, rightSpoon: sSpoon, identifier: "SW")
var seDev = Developer(leftSpoon: sSpoon, rightSpoon: neSpoon, identifier: "SE")
//var eDev = Developer(leftSpoon: eSpoon, rightSpoon: neSpoon, identifier: "EAST")

var developers = [nDev, wDev, swDev, seDev] //, eDev]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
