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
    
    private let lock = NSLock()
    
    private var _leftHand: Hand! = nil
    private var _rightHand: Hand! = nil
    
    private var _running: Bool = false
    
    private var _timesEaten: Int = 0
    
    // MARK: - Init
    
    init(id: Int, lSpoon: Spoon, rSpoon: Spoon) {
        self.id = id
        self._leftHand = Hand(self)
        self._rightHand = Hand(self)
        
        self.leftHand.spoon = lSpoon
        self.rightHand.spoon = rSpoon
    }
    
    // MARK: - Computed Properties
    private var leftHand: Hand {
        return _leftHand
    }
    private var rightHand: Hand {
        return _rightHand
    }
    
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
    
    
    // MARK: - Public Methods
    
    func think() {
        var readyToEat: Bool {
            return leftHand.holdingSpoon && rightHand.holdingSpoon
        }
        
        usleep(UInt32.random(in: 1...100))
        
        while !readyToEat {
            leftHand.tryPickingUpSpoon()
            rightHand.tryPickingUpSpoon()
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

// MARK: - Equatable

extension Developer: Equatable {
    static func == (lhs: Developer, rhs: Developer) -> Bool {
        return lhs === rhs
    }
}
