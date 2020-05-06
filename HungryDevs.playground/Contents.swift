import UIKit
import PlaygroundSupport

// MARK: - Creating The Classes

class Spoon {
    
    // MARK: - Properties
    // should prevent unavailable spoons from being picked up
    private let spoonLock = NSLock()
    
    // MARK: - Methods
    // when spoon should be pickup up
    func pickUp() {
        print("Picking Up Spoon")
        
        spoonLock.lock()
        
    }
    
    // we spoon should be put down
    func putDown() {
        print("Putting Down Spoon")
        
        spoonLock.unlock()
    }
    
}

class Developer {
    
    // MARK: - Properties
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    // MARK: - Init
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    // MARK: - Run method
    // should start "running" the robotic developers
    func run() {
        print("running")
        
        while true {
            think()
            eat()
        }
    }
    
    // MARK: - Other methods
    func think() {
        print("thinking")
        
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        print("eating")
        
        sleep(1)
    }
    
}

// MARK: - Create Spoons

let spoon0 = Spoon()
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()

// MARK: - Create Developers

let developer0 = Developer(leftSpoon: spoon0, rightSpoon: spoon1)
let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon0)

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
