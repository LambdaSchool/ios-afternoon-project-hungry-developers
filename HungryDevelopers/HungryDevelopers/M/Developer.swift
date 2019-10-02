//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Nathan Hedgeman on 10/2/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation

class Developer {
    
    //Properties
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var hasPickedUp: Bool = true
    var hasPutDown: Bool = false
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    //Functions
    func think() {
        leftSpoon?.pickUp()
        rightSpoon?.pickUp()
        return
    }
    
    func eat() {
        usleep(5)
        leftSpoon?.putDown()
        rightSpoon?.putDown()
        return
    }
    
    func run() {
        let run = true
        
        while run {
            think()
            eat()
        }
    }
}
