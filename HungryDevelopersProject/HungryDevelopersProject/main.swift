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
    var id: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    var numberOfSpoon = 0
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, id: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
    
    func eat() {
        usleep(useconds_t(Int.random(in: 1...1_000_000)))
        leftSpoon.putDown()
        rightSpoon.putDown()
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

let spoon1 = Spoon(1)
let spoon2 = Spoon(2)
let spoon3 = Spoon(3)
let spoon4 = Spoon(4)
let spoon5 = Spoon(5)








