import Foundation


// MARK: - Spoon

class Spoon {
    
    let lock = NSLock()
    var hasSpoon: Bool = false
    
    func pickUp() {
        while hasSpoon == false {
            hasSpoon = lock.try()
        }
    }
    
    func putdown() {
        lock.unlock()
        hasSpoon = false
    }
}


// MARK: - Developer

class Developer {
    let id: Int
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
    
    func think(completion: @escaping () -> ()) {
        DispatchQueue.global().async {
            self.leftSpoon.pickUp()
            print("Picked up Left Spoon!")
            self.rightSpoon.pickUp()
            print("Picked up Right Spoon!")
            print("Got Both!")
            completion()
        }
    }
    
    func eat() {
        print("Eating")
        usleep(1000000)
        leftSpoon.putdown()
        print("Put Down Left")
        rightSpoon.putdown()
        print("Put Down Right")
        print("Dropped Both")
    }
    
    func run() {
        think {
            self.eat()
        }
    }
}


// Create 5 Spoons and 5 Developers.

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()
let dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon2)
let dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon3)
let dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon4)
let dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon5)
let dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon1)


let devs: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: devs.count) { (index) in
    devs[index].run()
}
