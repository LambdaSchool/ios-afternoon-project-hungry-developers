//
//  Hand.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Hand {
    private let lock = NSLock()
    
    unowned var spoon: Spoon
    
    private(set) var holdingSpoon: Bool = false
    
    init(spoon: Spoon) {
        self.spoon = spoon
    }
    
    func tryPickingUpSpoon() {
        lock.lock()
        holdingSpoon = spoon.willBePickedUp()
        lock.unlock()
    }
    
    func dropSpoonIfHolding() {
        lock.lock()
        holdingSpoon = !spoon.willBePutDown()
        lock.unlock()
    }
}
