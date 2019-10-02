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
        
        if leftSpoon.identifier < rightSpoon.identifier {
            leftSpoon.pickUp()
            print("\(name) picks up left spoon")
            rightSpoon.pickUp()
            print("\(name) picks up right spoon")

        } else {
            rightSpoon.pickUp()
            print("\(name) picks up right spoon")
            leftSpoon.pickUp()
            print("\(name) picks up left spoon")

        }
    }
    
    func eat() {
        // Write eat() so that a developer will always pick up their lower-numbered spoon first. (The order in which they put them down doesn't matter.)
        print("\(name) starts eating")
        usleep(1000000)
        leftSpoon.putDown()
        print("\(name) puts down left spoon")
        rightSpoon.putDown()
        print("\(name) puts down right spoon")
        
        isEating = !isEating
    }
    
    func run() {
        print("Running...")
        let isTrue = true
        
        if isTrue == true {
            think()
            eat()
            run()
        }
    }
}
