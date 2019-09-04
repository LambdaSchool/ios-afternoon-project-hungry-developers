//
//  Developer.swift
//  HungryDeveloper
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

class Developer {
    var leftSpoon: Spoon!
    var rightSpoon:  Spoon!
    var loop = true
    
    func think() {
        print("developer thinking")
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        return
    }
    
    func eat() {
        print("developer eating")
        usleep(20000)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        while loop {
            think()
            eat()
        }
    }
}
