//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Enzo Jimenez-Soto on 6/3/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
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
            print("\(name) picked up left spoon")
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
        } else {
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
        }
    }
    func eat() {
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
