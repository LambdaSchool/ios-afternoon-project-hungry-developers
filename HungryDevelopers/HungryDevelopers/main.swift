//
//  main.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon {
    init(id: Int) {
        self.id = id
    }
    
    let id: Int
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    private let lock = NSLock()
}

class Developer {
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    func think() {
        print("\(name) is now thinking and waiting to pick up spoons \n")
        leftSpoon.pickUp()
        print("\(name) has picked up spoon #\(leftSpoon.id) \n")
        rightSpoon.pickUp()
        print("\(name) has picked up spoon #\(rightSpoon.id) \n")
    }
    
    func eat() {
        print("\(name) is now eating \n")
        usleep(UInt32.random(in: 10...100))
        rightSpoon.putDown()
        print("\(name) has put down spoon #\(rightSpoon.id)")
        leftSpoon.putDown()
        print("\(name) has put down spoon #\(leftSpoon.id) \n")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []

for i in 1...5 {
    spoons.append(Spoon(id: i))
}

let developerNames = ["A", "B", "C", "D", "E"]
var developers: [Developer] = []

for i in 0..<5 {
    developers.append(Developer(name: "Developer \(developerNames[i])", leftSpoon: spoons[i], rightSpoon: spoons[(i + 1) % spoons.count]))
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
