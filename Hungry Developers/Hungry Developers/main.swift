//
//  main.swift
//  Hungry Developers
//
//  Created by Isaac Lyons on 10/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import QuartzCore

let developersAndSpoonsCount = 5

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
    let index: Int
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, index: Int) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.index = index
    }
    
    func think() {
        print("Developer \(index) thinking.")
        
        if index == developersAndSpoonsCount - 1 {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        } else {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        }
    }
    
    func eat() {
        let duration = UInt32.random(in: 1000...5000)
        print("Developer \(index) eating.")
        usleep(duration)
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

for _ in 0..<developersAndSpoonsCount {
    spoons.append(Spoon())
}

var developers: [Developer] = []

for i in 0..<developersAndSpoonsCount {
    let leftSpoon = spoons[i]
    let rightSpoon = i + 1 == developersAndSpoonsCount ? spoons[0] : spoons [i + 1]
    developers.append(Developer(leftSpoon: leftSpoon, rightSpoon: rightSpoon, index: i))
}

DispatchQueue.concurrentPerform(iterations: developersAndSpoonsCount) {
    developers[$0].run()
}
