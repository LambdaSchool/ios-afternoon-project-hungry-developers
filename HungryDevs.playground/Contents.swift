import UIKit
import PlaygroundSupport

// MARK: - Creating The Classes

class Spoon {
    
    // MARK: - Properties
    let id: Int
    // should prevent unavailable spoons from being picked up
    private let spoonLock = NSLock()
    
    // MARK: - Init
    init(id: Int) {
        self.id = id
    }
    
    // MARK: - Methods
    // when spoon should be pickup up
    func pickUp() {
        spoonLock.lock()
        print("Spoon\(id) was picked up")
    }
    
    // we spoon should be put down
    func putDown() {
        spoonLock.unlock()
        print("Spoon\(id) was put down")
    }
    
}

class Developer {
    
    let id: Int
    
    // MARK: - Properties
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    // MARK: - Init
    init(leftSpoon: Spoon, rightSpoon: Spoon, id: Int) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
    
    // MARK: - Run method
    // should start "running" the robotic developers
    func run() {
        print("Developer\(id) has started running")
        
        while true {
            think()
            eat()
        }
    }
    
    // MARK: - Other methods
    func think() {
        print("Developer\(id) is thinking")
        if leftSpoon.id < rightSpoon.id {
        print("Developer\(id) is trying to pick up their leftSpoon")
        leftSpoon.pickUp()
        } else {
        print("Developer\(id) is trying to pick up their rightSpoon")
        rightSpoon.pickUp()
        }
    }
    
    func eat() {
        print("Developer\(id) is eating")
        
        sleep(1)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
}

//// MARK: - Queue
//
//public struct Queue<T> {
//
//    fileprivate var queue = [T]()
//
//    public var isEmpty: Bool {
//        return queue.isEmpty
//    }
//
//    public mutating func enqueue(_ element: T) {
//        queue.append(element)
//    }
//
//    public mutating func dequeue() -> T? {
//        guard !queue.isEmpty else { return nil }
//        queue.removeFirst()
//        return queue.first
//    }
//
//    public func peek() -> T? {
//        return queue.first
//    }
//}

// MARK: - Create Spoons

let spoon0 = Spoon(id: 0)
let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)

// MARK: - Create Developers

let developer0 = Developer(leftSpoon: spoon0, rightSpoon: spoon1, id: 0)
let developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, id: 1)
let developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, id: 2)
let developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, id: 3)
let developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon0, id: 4)

let allDevelopers = [developer0, developer1, developer2, developer3, developer4]

//// MARK: - Create Queue
//var queue = Queue<Developer>()

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
