//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Spoon {
    private(set) var holdingDev: Developer?
    
    func pickUp(_ dev: Developer) {
        if holdingDev == nil {
            holdingDev = dev
        }
    }
    
    func putDown() {
        holdingDev = nil
    }
}

class Developer: Equatable {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    var running: Bool = false
    
    var timesEaten: Int = 0
    
    init(lSpoon: Spoon, rSpoon: Spoon) {
        self.leftSpoon = lSpoon
        self.rightSpoon = rSpoon
    }
    
    func think() {
        leftSpoon.pickUp(self)
        rightSpoon.pickUp(self)
    }
    
    func eat() {
        if let leftSpoonHeldBy = leftSpoon.holdingDev,
            leftSpoonHeldBy == self,
            let rightSpoonHeldBy = rightSpoon.holdingDev,
            rightSpoonHeldBy == self
        {
            let eatTime = UInt32.random(in: 1...100)
            usleep(eatTime)
            timesEaten += 1
            leftSpoon.putDown()
            rightSpoon.putDown()
        } else {
            while leftSpoon.holdingDev != nil || rightSpoon.holdingDev != nil {
                eat()
            }
        }
    }
    
    func run() {
        running = true
        while running {
            think()
            eat()
        }
    }
    
    func stop() {
        running = false
    }
    
    static func == (lhs: Developer, rhs: Developer) -> Bool {
        return lhs === rhs
    }
}

let spoons = [
    Spoon(),
    Spoon(),
    Spoon(),
    Spoon(),
    Spoon()
]

let developers = [
    Developer(lSpoon: spoons[0], rSpoon: spoons[1]),
    Developer(lSpoon: spoons[1], rSpoon: spoons[2]),
    Developer(lSpoon: spoons[2], rSpoon: spoons[3]),
    Developer(lSpoon: spoons[3], rSpoon: spoons[4]),
    Developer(lSpoon: spoons[4], rSpoon: spoons[0])
]

DispatchQueue.concurrentPerform(iterations: developers.count + 1) {
    if $0 < developers.count {
        print("running \($0)")
        developers[$0].run()
    } else {
        sleep(5)
        for i in 0..<developers.count {
            developers[i].stop()
            print("Dev \(i) ate: \(developers[i].timesEaten)")
        }
    }
}
