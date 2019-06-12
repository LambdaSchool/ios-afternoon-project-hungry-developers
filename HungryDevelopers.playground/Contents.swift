import Foundation

class Spoon {
    
    var isInHand: Bool = false
    
    private let spoonLock = NSLock()
    
    init(isInHand: Bool = false) {
        self.isInHand = isInHand
    }
    
    
    func pickUp() {
        spoonLock.lock()
        isInHand = true
        spoonLock.unlock()
    }
    
    
    func putDown() {
        spoonLock.lock()
        isInHand = false
        spoonLock.unlock()
    }
}




class Developer {
    
    var exists = true
    let name: String
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(name: String, leftSpoon: Spoon? = nil, rightSpoon: Spoon? = nil) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
   
    func think() {
        leftSpoon?.pickUp()
        print("\(self.name) attempting to pick up left Spoon")
        rightSpoon?.pickUp()
        print("\(self.name) attempting to pick up right Spoon")
    }
    
    func eat() {
        let duration = UInt32.random(in: 10..<100)
        usleep(duration)
        leftSpoon?.putDown()
        rightSpoon?.putDown()
    }
    
    
    func run() {
        while exists == true {
            think()
            eat()
        }
    }
}






func dinner() {
    
    let spoon1 = Spoon(isInHand: false)
    let spoon2 = Spoon(isInHand: false)
    let spoon3 = Spoon(isInHand: false)
    let spoon4 = Spoon(isInHand: false)
    let spoon5 = Spoon(isInHand: false)
    
    
    let dev1 = Developer(name: "dev1", leftSpoon: spoon1, rightSpoon: spoon5)
    let dev2 = Developer(name: "dev2", leftSpoon: spoon2, rightSpoon: spoon1)
    let dev3 = Developer(name: "dev3", leftSpoon: spoon3, rightSpoon: spoon2)
    let dev4 = Developer(name: "dev4", leftSpoon: spoon4, rightSpoon: spoon3)
    let dev5 = Developer(name: "dev5", leftSpoon: spoon5, rightSpoon: spoon4)
    
    let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        print("Starting")
        developers[$0].run()
    }
    
    
}

dinner()
