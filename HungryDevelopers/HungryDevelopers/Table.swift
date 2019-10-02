//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Ciara Beitel on 10/2/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import Foundation

class Spoon {
    let spoon1 = Spoon()
    let spoon2 = Spoon()
    let spoon3 = Spoon()
    let spoon4 = Spoon()
    let spoon5 = Spoon()
    
    private var lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    let developer1 = Developer(leftSpoon: developer5.rightSpoon, rightSpoon: developer2.leftSpoon)
    let developer2 = Developer(leftSpoon: developer1.rightSpoon, rightSpoon: developer3.leftSpoon)
    let developer3 = Developer(leftSpoon: developer2.rightSpoon, rightSpoon: developer4.leftSpoon)
    let developer4 = Developer(leftSpoon: developer3.rightSpoon, rightSpoon: developer5.leftSpoon)
    let developer5 = Developer(leftSpoon: developer4.rightSpoon, rightSpoon: developer1.leftSpoon)
    
    let developers: [Developer] = [developer1, developer2, developer3, developer4, developer5]
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        usleep(1000000)
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    }
}
