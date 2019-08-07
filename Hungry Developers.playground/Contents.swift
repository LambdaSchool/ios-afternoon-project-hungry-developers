import UIKit

class Spoon {
    let index: Int
    private let lock = NSLock()
    
    init(_ index: Int) {
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
    let name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        let (lowerSpoon, higherSpoon) = leftSpoon.index < rightSpoon.index ? (leftSpoon, rightSpoon) : (rightSpoon, leftSpoon)
        
        lowerSpoon.pickUp()
        print("\(name) is attempting to pick up the spoon to their left.")
        
        higherSpoon.pickUp()
        print("\(name) is attempting to pick up the spoon to their right.")
      
    }
    
    func eat() {
        let time = UInt32.random(in: 5..<50)
        usleep(time)
        print("\(name) has started eating their meal. It took them \(time) seconds to get their food.")
        
        leftSpoon.putDown()
        print("\(name) is putting down the spoon to their left.")
        
        rightSpoon.putDown()
        print("\(name) is putting down the spoon to their right.")
        
    }
    
    func run() {
        while true {
            think()
            eat()
            usleep(1)
        }
    }
}


func dine() {
    let spoon1 = Spoon(1)
    let spoon2 = Spoon(2)
    let spoon3 = Spoon(3)
    let spoon4 = Spoon(4)
    let spoon5 = Spoon(5)
    
    let developer1 = Developer(name: "Kat", leftSpoon: spoon1, rightSpoon: spoon5)
    let developer2 = Developer(name: "Jack", leftSpoon: spoon2, rightSpoon: spoon1)
    let developer3 = Developer(name: "Mark", leftSpoon: spoon3, rightSpoon: spoon2)
    let developer4 = Developer(name: "Ariel", leftSpoon: spoon4, rightSpoon: spoon3)
    let developer5 = Developer(name: "Tom", leftSpoon: spoon5, rightSpoon: spoon4)
    
    let developers = [developer1, developer2, developer3, developer4, developer5]
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        print("Dinner is served!")
        developers[$0].run()
    }
}


dine()

