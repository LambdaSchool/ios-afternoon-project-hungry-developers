//
//  main.swift
//  HungryDevs
//
//  Created by Jesse Ruiz on 10/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import QuartzCore

var sharedResource = 0
let lock = NSLock()
let group = DispatchGroup()
let numberOfIterations = 5

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


class Developer {
    var name: String
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    init(name: String) {
        self.name = name
    }
    
    
    func think() {
        print("\(name) is thinking...")
        sleep(3)
        print("\(name) picks up the left spoon")
        leftSpoon?.pickUp()
        print("\(name) is thinking...")
        sleep(3)
        print("\(name) picks up the right spoon")
        rightSpoon?.pickUp()
        sleep(3)
    }
    
    func eat() {
        print("\(name) is eating...")
        sleep(3)
        print("\(name) puts down the left spoon")
        leftSpoon?.putDown()
        sleep(3)
        print("\(name) puts down the right spoon")
        rightSpoon?.putDown()
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


var Jesse: Developer = .init(name: "Jesse")
var Jon: Developer = .init(name: "Jon")
var Gi: Developer = .init(name: "Gi")
var Spencer: Developer = .init(name: "Spencer")
var Ben: Developer = .init(name: "Ben")

var arrayOfDevs: [Developer] = [Spencer, Jesse, Gi, Jon, Ben]

var spoon1 = Spoon.init(index: 1)
var spoon2 = Spoon.init(index: 2)
var spoon3 = Spoon.init(index: 3)
var spoon4 = Spoon.init(index: 4)
var spoon5 = Spoon.init(index: 5)


DispatchQueue.concurrentPerform(iterations: numberOfIterations) {
    arrayOfDevs[$0].run()
}


