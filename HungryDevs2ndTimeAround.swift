//
//  main.swift
//  hungryDevs2
//
//  Created by Lambda_School_Loaner_268 on 4/8/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import Foundation
import QuartzCore



// Spoon
class Spoon {
    init(index: Int) {
        self.index = index
    }
    func pickUp() {
        spoonLock.lock()
        self.onTable = false
        
    }
    func putDown() {
        spoonLock.unlock()
        self.onTable = true
        
    }
    private var spoonLock = NSLock()
    var index: Int
    var onTable: Bool = true
}

// Developer

class Developer {
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var name: String
    var count: Int = 0
    func think() {
        let startTime = CACurrentMediaTime()
        
        if leftSpoon.index < rightSpoon.index {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        let endtime = CACurrentMediaTime()
        let difference = endtime - startTime
        print("\(self.name) thought for \(difference) seconds!")
        return
    }
    func eat() {
        print("\(name) has started eating!")
        usleep(UInt32.random(in: 0...10))
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("\(self.name) has stopped eating!")
        count += 1
        print("\(name) has ate \(count) times!")
        return
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

// Table
let spoon1 = Spoon(index: 1)
let spoon2 = Spoon(index: 2)
let spoon3 = Spoon(index: 3)
let spoon4 = Spoon(index: 4)



let dev1 = Developer(leftSpoon: spoon4, rightSpoon: spoon1, name: "dev1")
let dev2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "dev2")
let dev3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "dev3")
let dev4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "dev4")



// setup
let developers = [dev1, dev2, dev3, dev4]

DispatchQueue.concurrentPerform(iterations: 6) {
    developers[$0].run()
}
