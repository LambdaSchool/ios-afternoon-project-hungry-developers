import UIKit


class Spoon {
    
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    private var lock = NSLock()
    func pickUp() {
        print("picked up spoon")
        lock.lock()
        putDown()
        
        lock.unlock()
        
        
    }
    
    func putDown(){
        print("put down spoon")
        
    }
    
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let name: String
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon){
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think(){
        
        while leftSpoon.index < rightSpoon.index {
            print("\(name) think picking up left spoon")
            leftSpoon.pickUp()
            print("\(name) think picking up right spoon")
            rightSpoon.pickUp()
            print("picked up right spoon")
        }
        
        
        
    }
    
    func eat(){
        print("\(name) is eating")
        usleep(10000)
        leftSpoon.putDown()
        print("\(name) put down left spoon")
        rightSpoon.putDown()
        print("\(name) put down right spoon")
        
    }
    
    func run(){
        think()
        eat()
        
    }
    
}

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)

let dev1 = Developer(name: "dev1", leftSpoon: spoon1, rightSpoon: spoon2)
let dev2 = Developer(name: "dev2", leftSpoon: spoon2, rightSpoon: spoon3)
let dev3 = Developer(name: "dev3", leftSpoon: spoon3, rightSpoon: spoon4)
let dev4 = Developer(name: "dev4", leftSpoon: spoon4, rightSpoon: spoon5)
let dev5 = Developer(name: "dev5", leftSpoon: spoon5, rightSpoon: spoon1)

let dev = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5){
    dev[$0].run()
}


// Finished
