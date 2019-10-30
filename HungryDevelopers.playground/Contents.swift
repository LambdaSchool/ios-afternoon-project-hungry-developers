import UIKit

var sharedResource = 0
let lock = NSLock()
let group = DispatchGroup()
let numberOfIterations = 5

class Spoon {
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}


class Developer {
    var name: String
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(name: String) {
        self.name = name
    }
    
    
    func think() {
        print("Thinking...")
        sleep(3)
        print("Picks up left spoon")
        leftSpoon?.pickUp()
        print("Thinking...")
        sleep(3)
        print("Picks up right spoon")
        rightSpoon?.pickUp()
        sleep(3)
    }
    
    func eat() {
        print("Eating...")
        sleep(3)
        print("Puts down left spoon")
        leftSpoon?.putDown()
        sleep(3)
        print("Puts down right spoon")
        rightSpoon?.putDown()
        sleep(3)
    }
    
    func run() {
        let count = 0
        while count == 0 {
            think()
            eat()
        }
    }
}


var Jesse: Developer = .init(name: "Jesse")
var Jon: Developer = .init(name: "Jon")
var Gi: Developer = .init(name: "Gi")
var Spencer: Developer = .init(name: "Spencer")
var Ben: Developer = .init(name: "Ben")

var arrayOfDevs: [Developer] = [Jesse, Jon, Gi, Spencer, Ben]
var devNames = arrayOfDevs

var spoon1: Spoon?
var spoon2: Spoon?
var spoon3: Spoon?
var spoon4: Spoon?
var spoon5: Spoon?


DispatchQueue.concurrentPerform(iterations: numberOfIterations) {
    group.enter()
    lock.lock()
    
    arrayOfDevs[$0].run()
    
    lock.unlock()
    group.leave()
}

group.wait()

