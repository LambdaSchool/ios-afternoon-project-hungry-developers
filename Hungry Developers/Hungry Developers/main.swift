//
//  main.swift
//  Hungry Developers
//
//  Created by Mark Gerrior on 4/8/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

let countLock = NSLock()

func incrementSpoonHeldCount() {
    countLock.lock()
    numOfSpoonsHeld += 1
    countLock.unlock()
}

func decrementSpoonHeldCount() {
    countLock.lock()
    numOfSpoonsHeld -= 1
    countLock.unlock()
}

class Spoon {

    let index: Int
    let lock = NSLock()
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
        incrementSpoonHeldCount()
    }
    
    func putDown() {
        decrementSpoonHeldCount()
        lock.unlock()
    }
}

class Developer {
    
    let id: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon

    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(id) left pickup  Held Count: \(numOfSpoonsHeld)")
            
            rightSpoon.pickUp()
            print("\(id) right pickup Held Count: \(numOfSpoonsHeld)")
        } else {
            rightSpoon.pickUp()
            print("\(id) right pickup Held Count: \(numOfSpoonsHeld)")

            leftSpoon.pickUp()
            print("\(id) left pickup  Held Count: \(numOfSpoonsHeld)")
        }
    }
    
    func eat() {
        let microsecondsToSleep = arc4random_uniform(UInt32.max) % 1_000_000
        usleep(microsecondsToSleep)
        
        rightSpoon.putDown()
        leftSpoon.putDown()
        
        print("\(id) ate          Held Count: \(numOfSpoonsHeld)")
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
var numOfSpoonsHeld = 0

var leftSpoon: Spoon
var rightSpoon = Spoon(index: 0)

for dev in 1...numOfDevs {
    
    leftSpoon = rightSpoon
    if dev == numOfDevs { // Last dev, grab the spoon from the first dev
        rightSpoon = devs[0].leftSpoon
    } else {
        rightSpoon = Spoon(index: dev)
    }
    
    devs.append(Developer(id: dev, leftSpoon: leftSpoon, rightSpoon: rightSpoon))
}

let pi = ProcessInfo()
print("processorCount = \(pi.processorCount)")

DispatchQueue.concurrentPerform(iterations: numOfDevs) {
    devs[$0].run()
}

