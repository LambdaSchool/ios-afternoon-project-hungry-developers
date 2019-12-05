//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class Spoon {
    let id: Int
    
    private let lock = NSLock()
    
    init(_ id: Int) {
        self.id = id
    }
    
    func willBePickedUp() -> Bool {
        let canPickUp = lock.try()
        if canPickUp {
            return true
        } else {
            return false
        }
    }
    
    @discardableResult func willBePutDown() -> Bool {
        lock.unlock()
        return true
    }
}
