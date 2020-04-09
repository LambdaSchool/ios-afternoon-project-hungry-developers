//
//  main.swift
//  Hungry Developers
//
//  Created by Mark Gerrior on 4/8/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

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
    
    let id: Int
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    func think() {
        leftSpoon.pickUp()
        numOfLeftSpoonsHeld += 1
        print("\(id) left pickup  \(numOfLeftSpoonsHeld):\(numOfRightSpoonsHeld)")
        rightSpoon.pickUp()
        numOfRightSpoonsHeld += 1
        print("\(id) right pickup \(numOfLeftSpoonsHeld):\(numOfRightSpoonsHeld)")
    }
    
    func eat() {
        var microsecondsToSleep: UInt32 = arc4random_uniform(UInt32.max) % 1_000
//        microsecondsToSleep = 100 // FIXME: Remove before flight
        usleep(microsecondsToSleep)
        
        rightSpoon.putDown()
        numOfLeftSpoonsHeld -= 1
        leftSpoon.putDown()
        numOfRightSpoonsHeld -= 1
        print("\(id) ate          \(numOfLeftSpoonsHeld):\(numOfRightSpoonsHeld)")
    }
    
    func run() {
    
        while true {
            think()
            eat()
        }
    }
}

var devs: [Developer] = []
let numOfDevs = 5
var numOfLeftSpoonsHeld = 0
var numOfRightSpoonsHeld = 0

var leftSpoon: Spoon
var rightSpoon = Spoon()

for dev in 0..<numOfDevs {
    
    leftSpoon = rightSpoon
    if dev == numOfDevs - 1 {
        rightSpoon = devs[0].leftSpoon
    } else {
        rightSpoon = Spoon()
    }
    
    devs.append(Developer(id: dev, leftSpoon: leftSpoon, rightSpoon: rightSpoon))
}

DispatchQueue.concurrentPerform(iterations: 5) {
    devs[$0].run()
}
