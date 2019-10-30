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
        let duration = UInt32.random(in: 1...20)
        usleep(duration)
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}


