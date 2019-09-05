import UIKit

class Spoon {
    
    static let semaphore: [DispatchSemaphore] = Array(repeating: DispatchSemaphore(value: 1), count: 5)
    let leftSpoon: DispatchSemaphore
    let rightSpoon: DispatchSemaphore
    
//    let index: Int
//    private let lock = NSLock()
//
    init(leftSpoonIndex: Int, rightSpoonIndex: Int) {
        if leftSpoonIndex > rightSpoonIndex {
            leftSpoon = Spoon.semaphore[leftSpoonIndex]
            rightSpoon = Spoon.semaphore[rightSpoonIndex]
        } else {
            leftSpoon = Spoon.semaphore[rightSpoonIndex]
            rightSpoon = Spoon.semaphore[leftSpoonIndex]
        }
    }
    
    func pickUp() {
        leftSpoon.wait()
        rightSpoon.wait()
    }
    
    func putDown() {
        leftSpoon.signal()
        rightSpoon.signal()
    }
}

class Developer {
    let name: String
    let spoons: Spoon
    let index: Int
    
    var leftIndex = -1
    var rightIndex = -1
    
    init(name: String, index: Int) {
        self.name = name
        self.leftIndex = index
        self.rightIndex = index - 1
        
        if rightIndex < 0 {
            rightIndex += 5
        }
        
        self.spoons = Spoon(leftSpoonIndex: leftIndex, rightSpoonIndex: rightIndex)
        self.index = index
        
    }
    
    func think() {
        spoons.pickUp()
        print("\(name) has picked up spoons \(leftIndex + 1) & \(rightIndex + 1)")
    }
    
    func eat() {
        let time = UInt32.random(in: 1_000_000..<10_000_000)
        usleep(time)
        
        if name == "Kat" || name == "Ariel" {
            print("\(name) has started eating her meal.")
        } else {
            print("\(name) has started eating his meal.")
        }
        
        spoons.putDown()
        print("\(name) has put down spoons \(leftIndex + 1) & \(rightIndex + 1)")
        
    }
    
    func run() {
        while true {
            think()
            eat()
            usleep(5_000_000)
        }
    }
}

func dine() {

    let names = ["Kat", "Jack", "Mark", "Ariel", "Tom"]
    let semaphore = DispatchSemaphore(value: 0)
    for index in 0...4 {
        DispatchQueue.global(qos: .background).async {
            let developers = Developer(name: "\(names[index])", index: index)
            developers.run()
        }
    }

    for semaphore in Spoon.semaphore {
        semaphore.signal()
    }

    semaphore.wait()
}


dine()

