//
//  Developer.swift
//  HungryDevelopersConcurrency
//
//  Created by Jessie Ann Griffin on 3/17/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import Foundation

class Developer {
    
    let times = 0
    let leftSpoon: Spoon = Spoon()
    let rightSpoon: Spoon = Spoon()
    let seconds: UInt32 = UInt32.random(in: 0 ... 5)
    
    
    private func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    private func eat() {
        usleep(seconds)
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func run() {
        while times == 0 {
            think()
            eat()
        }
    }
}

var developers: [Developer] {
    var developers: [Developer]
    for _ in 1...5 {
        developers.append(Developer())
    }
    return developers
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
