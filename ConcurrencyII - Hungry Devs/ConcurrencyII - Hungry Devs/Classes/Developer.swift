//
//  Developer.swift
//  ConcurrencyII - Hungry Devs
//
//  Created by Alex Rhodes on 10/2/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import Foundation

class Developer {
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    var isEating = true
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }

    func think() {
        //  think() should pick up both spoons before returning.
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        // Write eat() so that a developer will always pick up their lower-numbered spoon first. (The order in which they put them down doesn't matter.)
        NSLog("Is eating")
        usleep(10)
        leftSpoon.putDown()
        rightSpoon.putDown()
        NSLog("Is done eating")
    }
    
    func run() {
        let isTrue = true
        
        if isTrue == true {
        think()
        eat()
        }
    }
}
