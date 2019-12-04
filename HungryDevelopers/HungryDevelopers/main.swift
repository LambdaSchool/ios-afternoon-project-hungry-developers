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

class Developer {
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    var id: Int?
    
    var hasLeftSpoon: Bool = false
    var hasRightSpoon: Bool = false
    
    var running: Bool = false
    let lock = NSLock()
    
    private var _timesEaten: Int = 0
    
    var timesEaten: Int {
        get {
            lock.lock()
            let timesEaten = _timesEaten
            lock.unlock()
            return timesEaten
        } set(newValue) {
            lock.lock()
            _timesEaten = newValue
            lock.unlock()
        }
    }
    
    init(lSpoon: Spoon, rSpoon: Spoon) {
        self.leftSpoon = lSpoon
        self.rightSpoon = rSpoon
    }
    
    func think() {
        while !hasLeftSpoon || !hasRightSpoon {
            if !hasLeftSpoon { hasLeftSpoon = leftSpoon.pickUp() }
            if !hasRightSpoon { hasRightSpoon = rightSpoon.pickUp() }
        }
    }
    
    func eat() {
        let eatTime = UInt32.random(in: 1...10)
        print("dev \(id?.description ?? "?") eating")
        usleep(eatTime)
        timesEaten += 1
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        lock.lock()
        running = true
        var isRunning = running
        lock.unlock()
        
        while isRunning {
            think()
            eat()
            
            lock.lock()
            isRunning = running
            lock.unlock()
        }
    }
    
    func stop() {
        lock.lock()
        running = false
        lock.unlock()
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

for i in 0..<developers.count {
    developers[i].id = i
}

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
