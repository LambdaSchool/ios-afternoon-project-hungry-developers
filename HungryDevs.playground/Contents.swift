import UIKit

class Spoon {
    
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}


class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        return
    }
    
    func eat() {
        usleep(2000) //will sleep for .002 seconds
        
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}


