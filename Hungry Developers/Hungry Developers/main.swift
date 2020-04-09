//
//  main.swift
//  Hungry Developers
//
//  Created by Mark Gerrior on 4/8/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

class Spoon {

    let index: Int
    let lock = NSLock()
    
    init(index: Int) {
        self.index = index
    }
    
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
        OSAtomicIncrement32(&numOfLeftSpoonsHeld)
        print("\(id) left pickup  \(numOfLeftSpoonsHeld):\(numOfRightSpoonsHeld)")
        rightSpoon.pickUp()
        OSAtomicIncrement32(&numOfRightSpoonsHeld)
        print("\(id) right pickup \(numOfLeftSpoonsHeld):\(numOfRightSpoonsHeld)")
    }
    
    func eat() {
        let microsecondsToSleep: UInt32 = arc4random_uniform(UInt32.max) % 1_000_000
//        microsecondsToSleep = 100 // FIXME: Remove before flight
        usleep(microsecondsToSleep)
        
        rightSpoon.putDown()
        OSAtomicDecrement32(&numOfLeftSpoonsHeld)
        leftSpoon.putDown()
        OSAtomicDecrement32(&numOfRightSpoonsHeld)
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
var numOfLeftSpoonsHeld: Int32 = 0
var numOfRightSpoonsHeld: Int32 = 0

var leftSpoon: Spoon
var rightSpoon = Spoon(index: 0)

for dev in 1...numOfDevs {
    
    leftSpoon = rightSpoon
    if dev == numOfDevs - 1 {
        rightSpoon = devs[0].leftSpoon
    } else {
        rightSpoon = Spoon(index: dev)
    }
    
    devs.append(Developer(id: dev, leftSpoon: leftSpoon, rightSpoon: rightSpoon))
}

let pi = ProcessInfo()
print("processorCount = \(pi.processorCount)")

DispatchQueue.concurrentPerform(iterations: 5) {
    devs[$0].run()
}

