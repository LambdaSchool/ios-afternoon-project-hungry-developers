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
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(leftSpoon: Spoon? = nil, rightSpoon: Spoon? = nil) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
   
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
    }
    
    func eat() {
        let duration = UInt32.random(in: 10_000..<100_000)
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






func Dinner() {
    
    let spoon1 = Spoon(isInHand: false)
    let spoon2 = Spoon(isInHand: false)
    let spoon3 = Spoon(isInHand: false)
    let spoon4 = Spoon(isInHand: false)
    let spoon5 = Spoon(isInHand: false)
    
    
    let dev1 = Developer(leftSpoon: spoon1, rightSpoon: spoon5)
    let dev2 = Developer(leftSpoon: spoon2, rightSpoon: spoon1)
    let dev3 = Developer(leftSpoon: spoon3, rightSpoon: spoon2)
    let dev4 = Developer(leftSpoon: spoon4, rightSpoon: spoon3)
    let dev5 = Developer(leftSpoon: spoon5, rightSpoon: spoon4)
    
    let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
    
    DispatchQueue.concurrentPerform(iterations: 5) { _ in
        developers[$0].run()
    }
    
    
}
