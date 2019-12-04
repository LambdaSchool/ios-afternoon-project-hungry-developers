//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Spoon {
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}

class Developer {
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    var running: Bool = false
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        
    }
    
    func eat() {
        
    }
    
    func run() {
        while running {
            think()
            eat()
        }
    }
}
