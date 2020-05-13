import Foundation


// MARK: - Spoon (Class)

class Spoon {
    
    /// Properties
    let index: Int
    let lock = NSLock()
    var inPossession: Bool = false
    
    /// Initializer
    init(index: Int) {
        self.index = index
    }
    
    /// Functions
    // Pickup
    func pickUp() {
        while inPossession == false {
            inPossession = lock.try()
        }
    }
    
    // Putdown
    func putdown() {
        lock.unlock()
        inPossession = false
    }
}


// MARK: - Developer

class Developer {
    let id: Int
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think(completion: @escaping () -> ()) {
        var spoonsArray: [Spoon] = [leftSpoon, rightSpoon]
        spoonsArray.sort()
        spoonsArray[0].pickUp()
        print("Picked up Spoon: \(spoonsArray[0].index)")
        spoonsArray[1].pickUp()
        print("Picked up Spoon: \(spoonsArray[1].index)")
        completion()
    }
    
    func eat() {
        print("Dev:\(self.id) Eating")
        usleep(1000000)
        leftSpoon.putdown()
        rightSpoon.putdown()
        print("Dev:\(self.id) Dropped Both Spoons")
    }
    
    func run() {
        think {
            self.eat()
        }
    }
}


// Create 5 Spoons and 5 Developers.

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon2)
let dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon3)
let dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon4)
let dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon5)
let dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon1)


let devs: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: devs.count) { (index) in
    devs[index].run()
}


extension Spoon: Comparable {
    static func < (lhs: Spoon, rhs: Spoon) -> Bool {
        lhs.index < rhs.index
    }
    
    static func == (lhs: Spoon, rhs: Spoon) -> Bool {
        lhs.index == rhs.index
    }
}
