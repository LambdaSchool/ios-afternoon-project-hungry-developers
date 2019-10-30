//
//  main.swift
//  Hungry Developers
//
//  Created by Isaac Lyons on 10/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import QuartzCore

class Spoon {
    let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        let duration = UInt32.random(in: 10000...50000)
        print("Eating.")
        usleep(duration)
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let developersAndSpoonsCount = 5

var spoons: [Spoon] = []

for _ in 0..<developersAndSpoonsCount {
    spoons.append(Spoon())
}

var developers: [Developer] = []

for i in 0..<developersAndSpoonsCount {
    let leftSpoon = spoons[i]
    let rightSpoon = i + 1 == developersAndSpoonsCount ? spoons[0] : spoons [i + 1]
    developers.append(Developer(leftSpoon: leftSpoon, rightSpoon: rightSpoon))
}

DispatchQueue.concurrentPerform(iterations: developersAndSpoonsCount) {
    developers[$0].run()
}
