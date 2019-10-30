//
//  main.swift
//  HungryDevelopers
//
//  Created by Gi Pyo Kim on 10/30/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation
var id = 1

class Spoon {
    var spoonPickedUp = false
    let lock = NSLock()
    
    
    
    func pickUp() {
        lock.lock()
        spoonPickedUp = true
        lock.unlock()
    }
    
    func putDown() {
        lock.lock()
        spoonPickedUp = false
        lock.unlock()
    }
}

class Developer {
    var leftSpoon: Spoon!
    var rightSpoon: Spoon!
    let dev = id
    
    init() {
        id += 1
    }
    
    func think () {
        leftSpoon.pickUp()
//        print("\(dev) picked up left spoon")
        rightSpoon.pickUp()
//        print("\(dev) picked up right spoon")
        return
    }
    
    func eat() {
        let randomNumber = UInt32.random(in: 1...5)
        print("\(dev) started eating")
        usleep(randomNumber)
        print("\(dev) finished eating")
//        print("\(dev) put down left spoon")
        leftSpoon.putDown()
//        print("\(dev) put down right spoon")
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let dev1 = Developer()
let dev2 = Developer()
let dev3 = Developer()
let dev4 = Developer()
let dev5 = Developer()

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

dev1.leftSpoon = spoon1
dev2.rightSpoon = spoon1
dev2.leftSpoon = spoon2
dev3.rightSpoon = spoon2
dev3.leftSpoon = spoon3
dev4.rightSpoon = spoon3
dev4.leftSpoon = spoon4
dev5.rightSpoon = spoon4
dev5.leftSpoon = spoon5
dev1.rightSpoon = spoon5

var developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
    print("\(developers[$0]) started eating")
}
