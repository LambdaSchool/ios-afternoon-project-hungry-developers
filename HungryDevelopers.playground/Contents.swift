import Foundation

class Spoon {
    private let lock = NSLock()
    let rank: Int
    
    init(rank: Int) {
        self.rank = rank
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if leftSpoon.rank < rightSpoon.rank {
            leftSpoon.pickUp()
            print("\(name) picked up Left Spoon")
        } else {
            rightSpoon.pickUp()
            print("\(name) picked up Right Spoon")
        }
        return
    }
    
    func eat() {
        print("\(name) has started eating...")
        usleep(UInt32(Int.random(in: 1 ... 1000)))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) has finished eating...")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon(rank: 1)
let spoon2 = Spoon(rank: 2)
let spoon3 = Spoon(rank: 3)
let spoon4 = Spoon(rank: 4)
let spoon5 = Spoon(rank: 5)

let chad = Developer(name: "Chad", leftSpoon: spoon1, rightSpoon: spoon2)
let tyler = Developer(name: "Tyler", leftSpoon: spoon2, rightSpoon: spoon3)
let troy = Developer(name: "Troy", leftSpoon: spoon3, rightSpoon: spoon4)
let patrick = Developer(name: "Patrick", leftSpoon: spoon4, rightSpoon: spoon5)
let jonah = Developer(name: "Jonah", leftSpoon: spoon5, rightSpoon: spoon1)

let table = [chad, tyler, troy, patrick, jonah]

DispatchQueue.concurrentPerform(iterations: 5) { table[$0].run() }
