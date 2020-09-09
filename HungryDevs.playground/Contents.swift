import UIKit

class Spoon {
    
    let eatSafe = NSLock()
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
   func pickUp() {
        eatSafe.lock()
    }
    
   func putDown() {
    eatSafe.unlock()
    }
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    func think() {
        print("Developer \(self.name) is waiting to eat")
        if leftSpoon.id < rightSpoon.id {
            leftSpoon.pickUp()
            print("\(name) picked up the left spoon \(leftSpoon.id)")
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            print("\(name) picked up the right spoon \(rightSpoon.id)")
            leftSpoon.pickUp()
            print("\(name) picked up the left spoon \(leftSpoon.id)")
        }
    }
    
    func eat() {
        print("\(name) is eating their soup")
        usleep(2_000_000)
        leftSpoon.putDown()
        print("\(name) put down the left spoon \(leftSpoon.id)")
        rightSpoon.putDown()
        print("\(name) put down the right spoon \(rightSpoon.id)")
        
    }
    
    func run() {
        while true {
            self.think()
            self.eat()
        }
    }
}

let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)
let spoon5 = Spoon(id: 5)

let developer1 = Developer(name: "Glad", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "Shayla", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "Christina", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "Carson", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "Ghira", leftSpoon: spoon5, rightSpoon: spoon1)

let developerArray: [Developer] = [developer1, developer2, developer3, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {_ in 
    developerArray[0].run()
}
