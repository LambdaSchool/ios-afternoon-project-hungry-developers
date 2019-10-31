import Foundation


let pickupLock = NSLock()


class Spoon {
 
    let spoonNumber: String
    
    init(spoonNumber: String) {
        self.spoonNumber = spoonNumber
    }
    

    func pickUp() {
//        pickupLock.lock()
        print("Picked up \(spoonNumber)")
//        pickupLock.unlock()
    }

    
    func putDown() {
//        pickupLock.unlock()
        print("Put down \(spoonNumber)")
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
    
    //think() should pick up both spoons before returning.
    func think() {
        pickupLock.lock()
        leftSpoon.pickUp()
        rightSpoon.pickUp()
//        pickupLock.unlock()
        print("\(name) picked up \(leftSpoon.spoonNumber) and \(rightSpoon.spoonNumber)")
        
        
    }
    
    //eat() should pause for a random amount of time before putting both spoons down.
    func eat() {
        sleep(2)
        print("\(name) is now eating")
        leftSpoon.putDown()
        rightSpoon.putDown()
        pickupLock.unlock()
        print("\(name) put down \(leftSpoon.spoonNumber) and \(rightSpoon.spoonNumber)")

    }
    
    func run() {
        think()
        eat()
    }
    
}

// 5 Spoons

var spoon1 = Spoon(spoonNumber: "spoon1")
var spoon2 = Spoon(spoonNumber: "spoon2")
var spoon3 = Spoon(spoonNumber: "spoon3")
var spoon4 = Spoon(spoonNumber: "spoon4")
var spoon5 = Spoon(spoonNumber: "spoon5")




// 5 Developer:

let mark = Developer(name: "Mark", leftSpoon: spoon1, rightSpoon: spoon2)
let sonia = Developer(name: "Sonia", leftSpoon: mark.rightSpoon, rightSpoon: spoon3)
let frank = Developer(name: "Frank", leftSpoon: sonia.rightSpoon, rightSpoon: spoon4)
let kim = Developer(name: "Kim", leftSpoon: frank.rightSpoon, rightSpoon: spoon5)
let james = Developer(name: "James", leftSpoon: kim.rightSpoon, rightSpoon: mark.leftSpoon)

var developers = [mark, sonia, frank, kim, james]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}


