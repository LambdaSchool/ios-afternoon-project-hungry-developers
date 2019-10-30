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
    func pickUp() {
        
    }
    
    func putDown() {
        
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
        sleep(1)
        print("\(name) picks up left spoon")
        leftSpoon?.pickUp()
        print("\(name) is thinking...")
        sleep(1)
        print("\(name) picks up right spoon")
        rightSpoon?.pickUp()
        sleep(1)
    }
    
    func eat() {
        print("\(name) is eating...")
        sleep(1)
        print("\(name) puts down left spoon")
        leftSpoon?.putDown()
        sleep(1)
        print("\(name) puts down right spoon")
        rightSpoon?.putDown()
        sleep(1)
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

var spoon1: Spoon?
var spoon2: Spoon?
var spoon3: Spoon?
var spoon4: Spoon?
var spoon5: Spoon?


DispatchQueue.concurrentPerform(iterations: numberOfIterations) {
    group.enter()
    lock.lock()
    
    arrayOfDevs[$0].run()
    
    lock.unlock()
    group.leave()
}

group.wait()

