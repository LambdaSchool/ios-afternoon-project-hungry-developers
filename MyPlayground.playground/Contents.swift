import Foundation

class Spoon {
    
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}

class Developer {
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
    }
    
    func eat() {
        usleep(500)
        leftSpoon?.putDown()
        rightSpoon?.putDown()
    }
    
    func run() {
        think()
        eat()
        run()
    }
}
