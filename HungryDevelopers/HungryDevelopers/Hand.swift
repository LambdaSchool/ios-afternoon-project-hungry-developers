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
    
    weak var spoon: Spoon?
    
    private(set) var holdingSpoon: Bool = false
    
    func tryPickingUpSpoon() {
        lock.lock()
        if let didPickUpSpoon = spoon?.willBePickedUp() {
            holdingSpoon = didPickUpSpoon
        }
        lock.unlock()
    }
    
    func dropSpoonIfHolding() {
        lock.lock()
        if let didDropSpoon = spoon?.willBePutDown() {
            holdingSpoon = !didDropSpoon
        }
        lock.unlock()
    }
}
