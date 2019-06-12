import UIKit

class Spoon {
    
    var isInHand: Bool
    private let lock = NSLock()
    
    init(isInHand: Bool = false) {
        self.isInHand = isInHand
    }
    
    func pickUp() {
        lock.lock()
        isInHand = true
        lock.unlock()
    }
    
    func putDown() {
        lock.lock()
        isInHand = false
        lock.unlock()
    }
}

class Developer {
    
    let name: String
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var exists = true
    
    init(name: String, leftSpoon: Spoon? = nil, rightSpoon: Spoon? = nil) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon?.pickUp()
        print("\(name) attempting to pick up left spoon.")
        
        rightSpoon?.pickUp()
        print("\(name) attempting to pick up right spoon.")
    }
    
    func eat() {
        let duration = UInt32.random(in: 10..<100)
        usleep(duration)
        leftSpoon?.putDown()
        rightSpoon?.putDown()
    }
    
    func run() {
        while exists == true {
            think()
            eat()
        }
    }
}

func dinner() {
    let spoon1 = Spoon(isInHand: false)
    let spoon2 = Spoon(isInHand: false)
    let spoon3 = Spoon(isInHand: false)
    let spoon4 = Spoon(isInHand: false)
    let spoon5 = Spoon(isInHand: false)
    
    let dev1 = Developer(name: "Bob", leftSpoon: spoon1, rightSpoon: spoon5)
    let dev2 = Developer(name: "Jason", leftSpoon: spoon2, rightSpoon: spoon1)
    let dev3 = Developer(name: "Ted", leftSpoon: spoon3, rightSpoon: spoon2)
    let dev4 = Developer(name: "Bobby", leftSpoon: spoon4, rightSpoon: spoon3)
    let dev5 = Developer(name: "Dan", leftSpoon: spoon5, rightSpoon: spoon4)
    
    let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        print("Starting")
        developers[$0].run()
    }
}

dinner()
