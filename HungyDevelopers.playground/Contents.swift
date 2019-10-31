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
