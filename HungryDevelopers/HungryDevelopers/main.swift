//
//  main.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon {
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    private let lock = NSLock()
}

class Developer {
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        usleep(UInt32.random(in: 10...100))
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

var spoons: [Spoon] = []

for _ in 0..<5 {
    spoons.append(Spoon())
}

var developers: [Developer] = []

for i in 0..<5 {
    developers.append(Developer(leftSpoon: spoons[i], rightSpoon: spoons[(i + 1) % spoons.count]))
}
