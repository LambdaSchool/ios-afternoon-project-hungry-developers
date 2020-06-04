import UIKit


class Spoon {
    
    let id: Int
    private var spoonLock = NSLock()
    var whichDevIsEating: UUID?
    
    init(_ id: Int) {
        self.id = id
    }
    
    func pickUp() {
        spoonLock.lock()
    }
    
    func putDown() {
        spoonLock.unlock()
    }
}

class Developer {
    
    let id = UUID()
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    
    init(_ leftSpoon: Spoon, _ rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think() {
        let lowerSpoon: Spoon
        let higherSpoon: Spoon
        if rightSpoon.id < leftSpoon.id {
            lowerSpoon = rightSpoon
            higherSpoon = leftSpoon
        } else {
            lowerSpoon = leftSpoon
            higherSpoon = rightSpoon
        }
        lowerSpoon.pickUp()
        higherSpoon.pickUp()

//        leftSpoon.pickUp()
//        leftSpoon.whichDevIsEating = self.id
//        print("\(self.name) picked up \(leftSpoon.id)")
//
//        rightSpoon.pickUp()
//        rightSpoon.whichDevIsEating = self.id
//        print("\(self.name) picked up \(rightSpoon.id)")
    }
    
    func eat() {
        if rightSpoon.whichDevIsEating == leftSpoon.whichDevIsEating {
            print("\(self.name) is eating")
            usleep(200_000)
            print("\(self.name) finished eating")
            leftSpoon.putDown()
            print("\(self.name) put down \(leftSpoon.id)")
            rightSpoon.putDown()
            print("\(self.name) put down \(rightSpoon.id)")
        } else {
            return
        }
        
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
}

let spoon1 = Spoon(1)
let spoon2 = Spoon(2)
let spoon3 = Spoon(3)
let spoon4 = Spoon(4)
let spoon5 = Spoon(5)

let developer1 = Developer(spoon1, spoon2, name: "Stephanie")
let developer2 = Developer(spoon2, spoon3, name: "Tim")
let developer3 = Developer(spoon3, spoon4, name: "Chloe")
let developer4 = Developer(spoon4, spoon5, name: "Tracy")
let developer5 = Developer(spoon5, spoon1, name: "Julie")

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()

}

//DispatchQueue.concurrentPerform(iterations: 5) {
//    print("\(developers[$0].name) has joined the meal.")
//    developers[$0].run()
//}

// for an ios app this would be the best choice to make sure the UI stays running correctly on the mainqueue.
//let developerGroup = DispatchGroup()
//
//for developer in developers {
//    developerGroup.enter()
//    DispatchQueue.global(qos: .background).async {
//        developer.run()
//    }
//    developerGroup.leave()
//}
