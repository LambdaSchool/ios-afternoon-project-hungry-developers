import Foundation

var timeToEat =  true

class Spoon {
    func pickUp() {
        lock.lock()
    }
    func putDown() {
        lock.unlock()
    }
    let lock = NSLock()
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
}

class Developer {
    let name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("\(name) is starting to think.")
        if leftSpoon.index < rightSpoon.index {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        print("\(name) is done thinking.")
        return
    }
    
    func eat() {
        print("\(name) is eating.")
        usleep(50000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(name) is done eating.")
        return
    }
    
    func run() {
        while timeToEat == true  {
            think()
            eat()
        }
    }
}


let redSpoon = Spoon(index: 1)
let purpleSpoon = Spoon(index: 2)
let blueSpoon = Spoon(index: 3)
let greenSpoon = Spoon(index: 4)
let yellowSpoon = Spoon(index: 5)

let steveJobs = Developer(name: "Steve Jobs", leftSpoon: redSpoon, rightSpoon: purpleSpoon)
let elonMusk = Developer(name: "Elon Musk", leftSpoon: purpleSpoon, rightSpoon: blueSpoon)
let markZuckerberg = Developer(name: "Mark Zuckerberg", leftSpoon: blueSpoon, rightSpoon: greenSpoon)
let larryPage = Developer(name: "Larry Page", leftSpoon: greenSpoon, rightSpoon: yellowSpoon)
let adaLovelace = Developer(name: "Ada Lovelace", leftSpoon: yellowSpoon, rightSpoon: redSpoon)

let developerArray = [steveJobs, elonMusk, markZuckerberg, larryPage, adaLovelace]

print("Begin Test")
DispatchQueue.concurrentPerform(iterations: 5) {
    developerArray[$0].run()
}

