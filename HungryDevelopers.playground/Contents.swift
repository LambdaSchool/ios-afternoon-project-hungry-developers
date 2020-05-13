import UIKit


class Spoon {
    
    private var lock = NSLock()
    func pickUp() {
        lock.lock()
        putDown()
        
        lock.unlock()
        
        
    }
    
    func putDown(){
        
    }
    
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon){
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think(){
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        
        
    }
    
    func eat(){
        usleep(10000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        
    }
    
    func run(){
        think()
        eat()
        
    }
    
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let dev1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let dev2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let dev3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let dev4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
let dev5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)

let dev = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5){
    dev[$0].run()
}
