//
//  main.swift
//  HungryDevs
//
//  Created by Jesse Ruiz on 10/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import QuartzCore

let lock = NSLock()

class Spoon {
    
    private let lock = NSLock()
    
    var index: Int
    
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

let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)
let spoon5 = Spoon(index: 5)
let spoons: [Spoon] = [spoon1, spoon2, spoon3, spoon4, spoon5]


class Developer {
    var name: String
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    
    func think() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        if leftSpoon.index < rightSpoon.index {
            lock.lock()
            print("\(name) is thinking...")
            sleep(3)
            print("\(name) picks up the #\(leftSpoon.index) spoon")
            leftSpoon.pickUp()
            print("\(name) picks up the #\(rightSpoon.index) spoon")
            rightSpoon.pickUp()
            lock.unlock()
        } else {
            lock.lock()
            print("\(name) is thinking...")
            sleep(3)
            print("\(name) picks up the #\(leftSpoon.index) spoon")
            leftSpoon.pickUp()
            print("\(name) picks up the #\(rightSpoon.index) spoon")
            rightSpoon.pickUp()
            lock.unlock()
        }
    }
    
    func eat() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        print("\(name) is eating...")
        sleep(3)
        print("\(name) puts down the #\(leftSpoon.index) spoon")
        leftSpoon.putDown()
        print("\(name) puts down the #\(rightSpoon.index) spoon")
        rightSpoon.putDown()
        sleep(3)
    }
    
    func run() {
        let count = 0
        while count == 0 {
            think()
            eat()
        }
    }
}


var Jesse: Developer = .init(name: "Jesse", leftSpoon: spoon1, rightSpoon: spoon2)
var Jon: Developer = .init(name: "Jon", leftSpoon: spoon2, rightSpoon: spoon3)
var Gi: Developer = .init(name: "Gi", leftSpoon: spoon3, rightSpoon: spoon4)
var Spencer: Developer = .init(name: "Spencer", leftSpoon: spoon4, rightSpoon: spoon5)
var Ben: Developer = .init(name: "Ben", leftSpoon: spoon5, rightSpoon: spoon1)

var arrayOfDevs: [Developer] = [Jesse, Jon, Gi, Spencer, Ben]

DispatchQueue.concurrentPerform(iterations: 5) {
    arrayOfDevs[$0].run()
}


