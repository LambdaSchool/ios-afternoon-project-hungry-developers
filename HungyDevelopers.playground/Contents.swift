import Foundation




class Spoon {
    //
    //    let pickupLock = NSLock()
    //
    //    DispatchQueue.concurrentPerform(iterations: 100) { _ in
    //
    //    pickupLock.lock()
    func pickup() {
        
        
    }
    //    }
    
    
    func putDown() {
        
    }
}


class Developer {
    
    let leftSpoon: Spoon?
    let rightSpoon: Spoon?
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
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

let mark = Developer(leftSpoon: <#T##Spoon#>, rightSpoon: <#T##Spoon#>)

let sonia = Developer(leftSpoon: <#T##Spoon#>, rightSpoon: <#T##Spoon#>)

let frank = Developer(leftSpoon: <#T##Spoon#>, rightSpoon: <#T##Spoon#>)

let kim = Developer(leftSpoon: <#T##Spoon#>, rightSpoon: <#T##Spoon#>)

let james = Developer(leftSpoon: <#T##Spoon#>, rightSpoon: <#T##Spoon#>)



