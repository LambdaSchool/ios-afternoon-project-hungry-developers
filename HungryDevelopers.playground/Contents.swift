import UIKit


class Spoon {
    
    private let lock = NSLock()
    
    enum Spoons {
        case leftSpoon
        case rightSpoon
    }
    
    func pickUp(spoon1: Spoons, spoon2: Spoons) {
        
    }
    
    func putDown() {
        
    }
}

class Developer: Spoon {
    
    
    func think() {
        pickUp(spoon1: Spoons.leftSpoon, spoon2: Spoons.rightSpoon)
    }
    
    func eat() {
        usleep(2)
    }
    
    func run() {
        let x = 0
        while x == 0 {
            think()
            eat()
        }
    }
    
}


let developers = ["Developer1", "Developer2", "Developer3", "Developer4", "Developer5"]
