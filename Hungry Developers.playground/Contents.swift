import UIKit

// Adjustable Inputs
let eatTimeDelay: UInt32 = 500_000
let numberOfDevelopers = 5


// Setup array for displaying the current state of the program in the console
let spoonEmoji = "🥄"; let emptySpace = "  "; let thinkingEmoji = "🤔"; let eatingEmoji = "🍜"
var array: [String] = []
for _ in 0..<numberOfDevelopers {
    array += [emptySpace,thinkingEmoji,emptySpace,spoonEmoji]
}
print(array.joined())

enum SpoonSide { case left, right }
let lockArray = NSLock()

// Functions for updating and displaying the array in the console
func spoonMovedBy(devID: Int, spoonSide: SpoonSide) {
    lockArray.lock()
    let offset = 4 * (devID - 1)

    if spoonSide == .right {
        array.swapAt(offset + 2, offset + 3)
    } else {
        if devID == 1 {
            array.swapAt(0, array.count - 1)
        } else {
            array.swapAt(offset - 1, offset)
        }
    }
    print(array.joined())
    lockArray.unlock()
}
func devStartedEating(devID: Int) {
    lockArray.lock()
    let devIndex = (devID * 4) - 3
    array[devIndex] = eatingEmoji
    print(array.joined())
    lockArray.unlock()
}
func devFinishedEating(devID: Int) {
    lockArray.lock()
    let devIndex = (devID * 4) - 3
    array[devIndex] = thinkingEmoji
    print(array.joined())
    lockArray.unlock()
}



// MARK: - Spoon Class Definition

class Spoon {
    // Public Properties
    let index: Int
    
    // Public Methods
    func pickUp() { lockSpoon.lock() }
    func putDown() { lockSpoon.unlock() }
    
    // Private Properties
    private let lockSpoon = NSLock()
    
    // Initializer
    init(withIndex index: Int) {
        self.index = index
    }
}

// MARK: - Developer Class Definition

class Developer {
    // Public Properties
    let id: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    // Initializer
    init(leftSpoon: Spoon, rightSpoon: Spoon, id: Int) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
}

// MARK: - Waiter Class Definition

class Waiter {
    static let shared = Waiter()
    
    // Public Methods
    func requestPermissionToEat(for developer: Developer) {
        lockPermission.lock()
        
        developer.leftSpoon.pickUp()
        spoonMovedBy(devID: developer.id, spoonSide: .left) //print("Developer \(developer.id) picked up the left spoon.")
        
        developer.rightSpoon.pickUp()
        spoonMovedBy(devID: developer.id, spoonSide: .right) //print("Developer \(developer.id) picked up the right spoon.")
        
        lockPermission.unlock()
    }
    
    // Private Properties
    private let lockPermission = NSLock()
}



// MARK: - Developer Class Extension

extension Developer {
    // Public Methods
    func run() {
        while true {
            //think()
            requestPermissionToEat()
            eat()
        }
    }
    
    // Private Methods
    private func requestPermissionToEat() {
        Waiter.shared.requestPermissionToEat(for: self)
    }
    
    private func think() {
        if leftSpoon.index > rightSpoon.index {
            leftSpoon.pickUp()
            spoonMovedBy(devID: id, spoonSide: .left) //print("Developer \(id) picked up the left spoon.")
            
            rightSpoon.pickUp()
            spoonMovedBy(devID: id, spoonSide: .right) //print("Developer \(id) picked up the right spoon.")
            
        } else {
            rightSpoon.pickUp()
            spoonMovedBy(devID: id, spoonSide: .right) //print("Developer \(id) picked up the right spoon.")
            
            leftSpoon.pickUp()
            spoonMovedBy(devID: id, spoonSide: .left) //print("Developer \(id) picked up the left spoon.")
        }
    }
    
    private func eat() {
        devStartedEating(devID: id) //print("Developer \(id) started eating.")
        usleep(eatTimeDelay)
        devFinishedEating(devID: id) //print("Developer \(id) finished eating.")
        
        rightSpoon.putDown()
        spoonMovedBy(devID: id, spoonSide: .right) //print("Developer \(id) put down the right spoon.")
        
        leftSpoon.putDown()
        spoonMovedBy(devID: id, spoonSide: .left) //print("Developer \(id) put down the left spoon.")
    }
}



// MARK: - Setup & Run Program

// Create spoons
var spoons: [Spoon] = []

for index in 0..<numberOfDevelopers {
    spoons.append(Spoon(withIndex: index + 1))
}

// Create Developers
var developers = [Developer(leftSpoon: spoons[numberOfDevelopers - 1], rightSpoon: spoons[0], id: 1)]

for index in 0..<(numberOfDevelopers - 1) {
    developers.append(Developer(leftSpoon: spoons[index], rightSpoon: spoons[index + 1], id: index + 2))
}

// Run program
DispatchQueue.concurrentPerform(iterations: numberOfDevelopers) {
    developers[$0].run()
}

