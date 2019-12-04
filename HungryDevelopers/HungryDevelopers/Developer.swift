//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Developer {
    private(set) var id: Int
    
    private let lock = NSLock()
    
    private let leftSpoon: Spoon
    private let rightSpoon: Spoon
    
    private var hasLeftSpoon: Bool = false
    private var hasRightSpoon: Bool = false
    
    private var _running: Bool = false
    private var running: Bool {
        get {
            lock.lock()
            let value = _running
            lock.unlock()
            return value
        }
        set {
            lock.lock()
            _running = newValue
            lock.unlock()
        }
    }
    
    private var _timesEaten: Int = 0
    private(set) var timesEaten: Int {
        get {
            lock.lock()
            let value = _timesEaten
            lock.unlock()
            return value
        }
        set {
            lock.lock()
            _timesEaten = newValue
            lock.unlock()
        }
    }
    
    init(id: Int, lSpoon: Spoon, rSpoon: Spoon) {
        self.id = id
        self.leftSpoon = lSpoon
        self.rightSpoon = rSpoon
    }
    
    // MARK: - Public Methods
    
    func think() {
        while !hasLeftSpoon || !hasRightSpoon {
            if !hasLeftSpoon { hasLeftSpoon = leftSpoon.pickUp() }
            if !hasRightSpoon { hasRightSpoon = rightSpoon.pickUp() }
        }
    }
    
    func eat() {
        let eatTime = UInt32.random(in: 1...10)
        usleep(eatTime)
        
        timesEaten += 1
        
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        running = true
        var isRunning = running
        
        while isRunning {
            think()
            eat()
            
            isRunning = running
        }
    }
    
    func stop() {
        running = false
    }
    
    func reset() {
        timesEaten = 0
    }
}
