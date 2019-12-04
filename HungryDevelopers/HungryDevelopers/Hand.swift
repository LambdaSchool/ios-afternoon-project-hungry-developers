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
    
    private unowned let developer: Developer
    weak var spoon: Spoon?
    
    private(set) var holdingSpoon: Bool = false
    
    init(_ developer: Developer) {
        self.developer = developer
    }
    
    func tryPickingUpSpoon() {
        lock.lock()
        if let didPickUpSpoon = spoon?.willBePickedUp(by: developer) {
            holdingSpoon = didPickUpSpoon
        }
        lock.unlock()
    }
    
    func dropSpoonIfHolding() {
        lock.lock()
        if let didDropSpoon = spoon?.willBePutDown(by: developer) {
            holdingSpoon = !didDropSpoon
        }
        lock.unlock()
    }
}
