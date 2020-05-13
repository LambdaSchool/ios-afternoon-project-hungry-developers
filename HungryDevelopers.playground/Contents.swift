import UIKit

class Spoon {
    
    //MARK: - Properties -
    
    private let lock = NSLock()
    
    //MARK: - Methods -
    
    func pickUp() {
        lock.lock()
        print("The spoon was picked up")
    }
    
    func putDown() {
        lock.unlock()
        print("The spoon was put down")
    }
    
}

class Developer {
    
    //MARK: - Properties -
    
    let leftSpoon = Spoon()
    let rightSpoon = Spoon()
    
    //MARK: - Mehtods -
    
    func think() {
        
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        
    }
    
    func eat() {
        
        usleep(1)
        rightSpoon.putDown()
        leftSpoon.putDown()
        
    }
    
    func run() {
        
        while 1 == 1 {
            think()
            eat()
        }
        
    }
    
}

let developer1 = Developer()
let developer2 = Developer()
let developer3 = Developer()
let developer4 = Developer()
let developer5 = Developer()

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

var developers: [Developer] = []

developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)
developers.append(developer5)

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
