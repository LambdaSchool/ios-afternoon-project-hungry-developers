import Foundation


class Spoon {

    var index: Int
    private var lock = NSLock()

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


class Developer {
    var LSpoon: Spoon
    var RSpoon: Spoon
    var name: String

    init(LSpoon: Spoon, RSpoon: Spoon, name: String) {
        self.LSpoon = LSpoon
        self.RSpoon = RSpoon
        self.name = name
    }



    func run() {
        while true {
            think()
            eat()
        }
    }


    func think() {

        if LSpoon.index < RSpoon.index {
            LSpoon.pickUp()
            print("\(name) has picked up the spoon to the left \(LSpoon.index)")
            RSpoon.pickUp()
            print("\(name) has picked up the spoon to the right \(RSpoon.index)")

        } else {
            RSpoon.pickUp()
            print("\(name) has picked up the spoon to the right \(RSpoon.index)")
            LSpoon.pickUp()
            print("\(name) has picked up the spoon to the left \(LSpoon.index)")
        }
    }

    func eat() {

        print("\(name) is currently eating")
        usleep(UInt32.random( in: 1...150))
        LSpoon.putDown()
        print("\(name) has put down the left spoon \(LSpoon.index)")
        RSpoon.putDown()
        print("\(name) has put down the right spoon \(RSpoon.index)")
    }

}


var spoons: [Spoon] = []
for i in 1...4 {
    spoons.append(Spoon(index: i))
}

var developerNames = ["Challenger", "Columbia", "Discovery", "Endeavour"]
var developers: [Developer] = []
for i in 0...3 {
    developers.append(Developer(LSpoon: spoons[i], RSpoon: spoons[(i + 1) % spoons.count], name: developerNames[i]))
}

DispatchQueue.concurrentPerform(iterations: 4) {
    developers[$0].run()
}
