import Foundation

class Spoon {
    private let lock = NSLock()
    
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    //Properties
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    //Functions
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
        eat()
    }
    func eat() {
        print("\(String(describing: Developer.self)) started eating")
        usleep(50)
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        print("\(String(describing: Developer.self)) finished eating")
        //run()
    }
    func run() {
        let this = true
        while this {
        think()
        eat()
        run()
        }
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

let dinnerTable: [Developer] = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    dinnerTable[$0].run()
    //print("hello")
}
