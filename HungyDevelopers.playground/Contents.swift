import Foundation



let pickupLock = NSLock()

class Spoon {
    //
    //
    //    DispatchQueue.concurrentPerform(iterations: 100) { _ in
    //
        pickupLock.lock()
    func pickup() {
        
        
    }
    //    }
    pickupLock.unlock()
    
    func putDown() {
        
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
        print("Picked up spoons")
        
        
    }
    
    //eat() should pause for a random amount of time before putting both spoons down.
    func eat() {
        sleep(2)
        
        
    }
    
    func run() {
        think()
        eat()
    }
    
}

// 5 Spoons

var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()




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


