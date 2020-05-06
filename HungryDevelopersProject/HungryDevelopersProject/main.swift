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
        lock.lock()
    }
    
    func putDown() {
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
        print("\(id) is eating")
    }
    
    func think() {
        print("\(id) is thinking")
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon else { return }
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(id) picked up left spoon")
            rightSpoon.pickUp()
            print("\(id) picked up right spoon")
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func run() {
        
        while true {
            print("running")
            think()
            eat()
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


let developers = [developer1, developer2, developer3, developer4, developer5]


DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

