//
//  main.swift
//  Hungry Developers
//
//  Created by Mark Gerrior on 4/8/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

class Spoon {

    let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    
    let leftSpoon = Spoon()
    let rightSpoon = Spoon()
    
    func think() {
        
    }
    
    func eat() {
        
    }
    
    func run() {
    
        while true {
            think()
            eat()
        }
    }
}
