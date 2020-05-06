import UIKit
import PlaygroundSupport

// MARK: - Creating The Classes

class Spoon {
    
    // MARK: - Properties
    let id: String
    // should prevent unavailable spoons from being picked up
    private let spoonLock = NSLock()
    
    // MARK: - Init
    init(id: String) {
        self.id = id
    }
    
    // MARK: - Methods
    // when spoon should be pickup up
    func pickUp() {
        print("\(id) was picked up")
        
        spoonLock.lock()
        
    }
    
    // we spoon should be put down
    func putDown() {
        print("\(id) was put down")
        
        spoonLock.unlock()
    }
    
}

class Developer {
    
    let id: String
    
    // MARK: - Properties
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    // MARK: - Init
    init(leftSpoon: Spoon, rightSpoon: Spoon, id: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
    
    // MARK: - Run method
    // should start "running" the robotic developers
    func run() {
        print("\(id) has started running")
        
        while true {
            think()
            eat()
        }
    }
    
    // MARK: - Other methods
    func think() {
        print("\(id) is thinking")

        print("\(id) is trying to pick up their leftSpoon")
        leftSpoon.pickUp()
        print("\(id) is trying to pick up their rightSpoon")
        rightSpoon.pickUp()
    }
    
    func eat() {
        print("\(id) is eating")

        sleep(1)
    }
    
}

// MARK: - Create Spoons

let spoon0 = Spoon(id: "Spoon0")
let spoon1 = Spoon(id: "Spoon1")
let spoon2 = Spoon(id: "Spoon2")
let spoon3 = Spoon(id: "Spoon3")
let spoon4 = Spoon(id: "Spoon4")

// MARK: - Create Developers

let developer0 = Developer(leftSpoon: spoon0, rightSpoon: spoon1, id: "Developer0")
let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, id: "Developer1")
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, id: "Developer2")
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, id: "Developer3")
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon0, id: "Developer4")

let allDevelopers = [developer0, developer1, developer2, developer3, developer4]

// MARK: - Running The Program

DispatchQueue.concurrentPerform(iterations: 5) {
    allDevelopers[$0].run()
}


//To recap the algorithm you're writing here, each developer will:
//
//think until the left spoon is available; when it is, pick it up;
//think until the right spoon is available; when it is, pick it up;
//when both spoons are held, eat for a fixed amount of time;
//then, put the right spoon down;
//then, put the left spoon down;
//repeat from the beginning.
