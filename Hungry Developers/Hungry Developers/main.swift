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
    
    let leftSpoon = Spoon()
    let rightSpoon = Spoon()
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        var microsecondsToSleep: UInt32 = arc4random_uniform(UInt32.max) % 1_000
        microsecondsToSleep = 100 // FIXME: Remove before flight
        usleep(microsecondsToSleep)
        
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func run() {
    
        while true {
            think()
            eat()
        }
    }
}
