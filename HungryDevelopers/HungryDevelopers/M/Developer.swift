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
    var name: String
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var hasPickedUp: Bool = true
    var hasPutDown: Bool = false
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    //Functions
    func think() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else {return}
        if leftSpoon.spoonNumber < rightSpoon.spoonNumber {
        leftSpoon.pickUp()
        print("\(name) left spoon picked up")
        rightSpoon.pickUp()
        print("\(name) right spoon picked up")
        } else {
            return
        }
    }
    
    func eat() {
        print("\(name) started eating")
        usleep(1000)
        rightSpoon?.putDown()
        print("\(name) right spoon put down")
        leftSpoon?.putDown()
        print("\(name) left spoon put down")
        print("\(name) finished eating")
    }
    
    func run() {
        let this = true
        
        while this {
            think()
            eat()
            run()
        }
    }
}
