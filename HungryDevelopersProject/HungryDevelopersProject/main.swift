//
//  main.swift
//  HungryDevelopersProject
//
//  Created by Bhawnish Kumar on 5/6/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import Foundation

class Spoon {
    private var lock = NSLock()
    
    var index = 0
    
    init(_ index: Int) {
        self.index = index
    }
    func pickUp() {
        print("Picked up spoon")
        lock.lock()
    }
    
    func putDown() {
        print("Put down spoon")
        lock.unlock()
    }
}

class Developer{
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    var numberOfSpoon = 0
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func eat() {
        usleep(1)
        print("eating")
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func run() {
        print("running")
        while true {
            eat()
            think()
        }
    }
    
   
    
}

