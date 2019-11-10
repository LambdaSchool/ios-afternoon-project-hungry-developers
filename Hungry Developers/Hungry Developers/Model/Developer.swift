//
//  Developer.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/7/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation

class Developer {
    let devID: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.devID = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("Dev \(devID) thinking.")
        leftSpoon.pickUp(by: devID)
        rightSpoon.pickUp(by: devID)
    }
    
    func eat() {
        print("Dev \(devID) eating.")
        usleep(useconds_t(Int.random(in: 1...1000)))
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}
