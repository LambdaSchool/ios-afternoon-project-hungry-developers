//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Spoon {
    private let lock = NSLock()
    
    func pickUp() -> Bool {
        return lock.try()
    }
    
    func putDown() {
        lock.unlock()
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
        while !hasLeftSpoon || !hasRightSpoon {
            if !hasLeftSpoon { hasLeftSpoon = leftSpoon.pickUp() }
            if !hasRightSpoon { hasRightSpoon = rightSpoon.pickUp() }
        }
        return
    }
    
    func eat() {
        let eatTime = UInt32.random(in: 1...200)
        usleep(eatTime)
        timesEaten += 1
        leftSpoon.putDown()
        rightSpoon.putDown()
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
