import UIKit


class Spoon {
    
    let id: Int
    private var spoonLock = NSLock()
    var whichDevIsEating: UUID?
    
    init(_ id: Int) {
        self.id = id
    }
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}

class Developer {
    
    let id = UUID()
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    
    init(_ leftSpoon: Spoon, _ rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        pickUp()
    }
    
    func eat() {
        usleep(2)
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
}

let spoon1 = Spoon(1)
let spoon2 = Spoon(2)
let spoon3 = Spoon(3)
let spoon4 = Spoon(4)
let spoon5 = Spoon(5)

let developer1 =
let developer2 =
let developer3 =
let developer4 =
let developer5 =

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
