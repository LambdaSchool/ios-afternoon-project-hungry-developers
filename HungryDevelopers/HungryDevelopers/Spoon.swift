//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Spoon {
    private let lock = NSLock()
    
    private(set) weak var holdingDev: Developer?
    
    func willBePickedUp(by developer: Developer) -> Bool {
        let canPickUp = lock.try()
        if canPickUp && holdingDev == nil {
            holdingDev = developer
            return true
        } else {
            return false
        }
    }
    
    @discardableResult func willBePutDown(by developer: Developer) -> Bool {
        guard let holder = holdingDev, holder == developer else { return false }
        holdingDev = nil
        lock.unlock()
        return true
    }
}
