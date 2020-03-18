import Foundation

var hasSpoon: Bool = true
var sharedResource = hasSpoon
let group = DispatchGroup()
let myQueue = DispatchQueue(label: "Shared Access Queue")
let lock = NSLock()
//let spoonCount = 5
//let developerCount = 5
//var index = 0

class Spoon {
    var index = 0
    private var spoonLock = NSLock()
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
       
    }
}

class Developer {
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSppon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSppon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("\(name) is thinking")
        if leftSpoon.index < rightSpoon.index {
            lock.lock()
            leftSpoon.pickUp()
            rightSpoon.pickUp()
            lock.unlock()
        } else {
            lock.lock()
            rightSpoon.pickUp()
            leftSpoon.pickUp()
            lock.unlock()
            print("\(name) is  done thinking")
            return
        }
        
    }
    
    func eat() {
        print("\(name) is eating")
        usleep(100)
        lock.lock()
        leftSpoon.putDown()
        rightSpoon.putDown()
        lock.unlock()
        print("\(name) is done eating")
        return
    }
    
    func run() {
            think()
            eat()
    }
}

var spoon1 = Spoon(index: 1),
spoon2 = Spoon(index: 2),
spoon3 = Spoon(index: 3),
spoon4 = Spoon(index: 4),
spoon5 = Spoon(index: 5)

let developer1 = Developer(name: "Bruce Wayne", leftSppon: spoon1, rightSpoon: spoon2),
developer2 = Developer(name: "Kobe Bryant", leftSppon: spoon2, rightSpoon: spoon3),
developer3 = Developer(name: "Johnny Hicks", leftSppon: spoon3, rightSpoon: spoon4),
developer4 = Developer(name: "Steven Berard", leftSppon: spoon4, rightSpoon: spoon5),
developer5 = Developer(name: "Luqmaan Khan", leftSppon: spoon5, rightSpoon: spoon1)


var developersArray = [developer1,developer2,developer3,developer4,developer5]

print("Begin Test")
DispatchQueue.concurrentPerform(iterations: 5) {
    developersArray[$0].run()
}
