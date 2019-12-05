//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Developer {
    // MARK: - Properties
    
    private(set) var id: Int
    
    private var leftHand = Hand()
    private var rightHand = Hand()
    
    private let lock = NSLock()
    
    private(set) var loopStartTime: Date? {
        willSet {
            lock.lock()
            if let previousTime = loopStartTime?.timeIntervalSinceReferenceDate {
                self.waitTimes.append(Date().timeIntervalSinceReferenceDate - previousTime)
            }
            lock.unlock()
        }
    }
    
    private(set) var waitTimes = [Double]()
    
    private var _running: Bool = false
    
    private var _timesEaten: Int = 0
    
    // MARK: - Computed Properties
    
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
    
    // MARK: - Init
    
    init(id: Int, lSpoon: Spoon, rSpoon: Spoon) {
        self.id = id
        
        self.leftHand.spoon = lSpoon
        self.rightHand.spoon = rSpoon
    }
    
    // MARK: - Public Methods
    
    func think() {
        var readyToEat: Bool {
            return leftHand.holdingSpoon && rightHand.holdingSpoon
        }
        
        usleep(UInt32.random(in: 1...100))
        
        while !readyToEat {
            if let leftId = leftHand.spoon?.id,
                let rightid = rightHand.spoon?.id,
                leftId < rightid
            {
                leftHand.tryPickingUpSpoon()
                rightHand.tryPickingUpSpoon()
            } else {
                rightHand.tryPickingUpSpoon()
                leftHand.tryPickingUpSpoon()
            }
            if readyToEat {
                return
            } else {
                leftHand.dropSpoonIfHolding()
                rightHand.dropSpoonIfHolding()
            }
        }
    }
    
    func eat() {
        usleep(UInt32.random(in: 1...100))
        
        timesEaten += 1
        
        leftHand.dropSpoonIfHolding()
        rightHand.dropSpoonIfHolding()
    }
    
    func run() {
        running = true
        var isRunning = running
        
        while isRunning {
            loopStartTime = Date()
            
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
        self.waitTimes = []
    }
}

// MARK: - Equatable

extension Developer: Equatable {
    static func == (lhs: Developer, rhs: Developer) -> Bool {
        return lhs === rhs
    }
}
