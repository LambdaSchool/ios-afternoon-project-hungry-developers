import Foundation




class Spoon {
    
    let pickupLock = NSLock()
    
    DispatchQueue.concurrentPerform(iterations: 100) { _ in
    
    pickupLock.lock()
    func pickup() {
    
    
    }
    }
    
    
    func putDown() {
        
    }
}
