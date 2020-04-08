//
//  main.swift
//  Hungry Developers
//
//  Created by Wyatt Harrell on 4/8/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class Spoon {
    
    private var spoonLock = NSLock()
    
    func pickUp() {
        spoonLock.lock()
        spoonLock.unlock()
    }
    
    func putDown() {
        spoonLock.lock()
        spoonLock.unlock()
    }
    
}

class Developer {
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        return
    }
    
    func eat() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
        NSLog("Started Eating")
        usleep(useconds_t(Int.random(in: 0...10000)))
        leftSpoon.putDown()
        rightSpoon.putDown()
        NSLog("Finsihed Eating")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developer1 = Developer()
developer1.leftSpoon = spoon1
developer1.rightSpoon = spoon2

let developer2 = Developer()
developer2.leftSpoon = spoon2
developer2.rightSpoon = spoon3

let developer3 = Developer()
developer3.leftSpoon = spoon3
developer3.rightSpoon = spoon4

let developer4 = Developer()
developer4.leftSpoon = spoon4
developer4.rightSpoon = spoon5

let developer5 = Developer()
developer5.leftSpoon = spoon5
developer5.rightSpoon = spoon1

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
