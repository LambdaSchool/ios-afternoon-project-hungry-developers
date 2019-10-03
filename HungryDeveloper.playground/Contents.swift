import UIKit


class Spoon {
    private var lock = NSLock()
    var index = Int()
    
    func pickup() {
        lock.lock()
        print("Starting to eat with spoon \(index)")
    }
    
    func putDown(){
        lock.unlock()
        print("Putting down spoon \(index)")
    }
    
    
}

class Developer {
    
    var leftSpoon = Spoon()
    var rightSpoon =  Spoon()
    var whichDev = String()
    
    func think() {
        leftSpoon.pickup()
        rightSpoon.pickup()
        print("I'm done thinking")
    }
    
    func eat() {
        print("Time to eat")
        usleep(10)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Took a bite")
    }
    
    func run() {
        
        think()
        eat()
        print("Next dev up")
    }
    
    
}
var lock = NSLock()
var mySpoon = Spoon()
var yourSpoon = Spoon()
var herSpoon = Spoon()
var hisSpoon = Spoon()
var theOtherGuysSpoon = Spoon()

var myDev = Developer()
var yourDev = Developer()
var herDev = Developer()
var hisDev = Developer()
var theOtherDev = Developer()

var developers = Array<Developer>([myDev, yourDev, herDev, hisDev, theOtherDev])
//developers.append(myDev)
//developers.append(yourDev)
//developers.append(herDev)
//developers.append(hisDev)
//developers.append(theOtherDev)

extension NSLock {
    func withLock( _ work: () -> Void) {
        lock()
        work()
        unlock()
    }
}

DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    print("\()just ate")
}
