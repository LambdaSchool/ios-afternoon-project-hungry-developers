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
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var numberOfSpoon = 0
    
    init(id: String) {
        self.id = id
    }
    
    func eat() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        
        usleep(useconds_t(Int.random(in: 1...1_000_000)))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("eating")
    }
    
    func think() {
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
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

let developer1 = Developer(id: "Developer 1")
developer1.leftSpoon = spoon1
developer1.rightSpoon = spoon2

let developer2 = Developer(id: "Developer 2")
developer2.leftSpoon = spoon2
developer2.rightSpoon = spoon3

let developer3 = Developer(id: "Developer 3")
developer3.leftSpoon = spoon3
developer3.rightSpoon = spoon4

let developer4 = Developer(id: "Developer 4")
developer4.leftSpoon = spoon4
developer4.rightSpoon = spoon5

let developer5 = Developer(id: "Developer 5")
developer5.leftSpoon = spoon5
developer5.rightSpoon = spoon1







