import Cocoa

// MARK: - Part One

// Create a class called Spoon. It should have two methods, pickUp() and putDown().
class Spoon {
    let lock = NSLock()
    let group = DispatchGroup()
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

/* Create a class called Developer. It should have a leftSpoon and rightSpoon property. Also a think(), eat(), and run() method. */
class Developer {
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func think() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon
            else { return }
        
        let leftId = leftSpoon.id
        let rightId = rightSpoon.id
        
        if leftId < rightId {
            leftSpoon.pickUp()
            print("Developer \(id) picked up their left Spoon")
            rightSpoon.pickUp()
            print("Developer \(id) up their right Spoon")
        } else {
            rightSpoon.pickUp()
            print("Developer \(id) picked up their right Spoon")
            leftSpoon.pickUp()
            print("Developer \(id) picked up their left Spoon")
        }
        
    }
    
    func eat() {
        usleep(1_000_000)
        leftSpoon?.putDown()
        print("Developer \(id) put down their left spoon")
        rightSpoon?.putDown()
        print("Developer \(id) put down their right spoon")
    }
    
    func run() {
        while id <= 5 {
            think()
            eat()
        }
    }
}

// Create 5 Spoons and 5 Developers
var developers = [Developer]()
let dev1 = Developer(id: 1)
let dev2 = Developer(id: 2)
let dev3 = Developer(id: 3)
let dev4 = Developer(id: 4)
let dev5 = Developer(id: 5)

let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)
let spoon5 = Spoon(id: 5)

dev5.rightSpoon = spoon1

dev1.leftSpoon = spoon1
dev1.rightSpoon = spoon2

dev2.leftSpoon = spoon2
dev2.rightSpoon = spoon3

dev3.leftSpoon = spoon3
dev3.rightSpoon = spoon4

dev4.leftSpoon = spoon4
dev4.rightSpoon = spoon5

dev5.leftSpoon = spoon5

developers = [ dev1, dev2, dev3, dev4, dev5 ]

DispatchQueue.concurrentPerform(iterations: 5) { count in
    developers[count].run()
}

