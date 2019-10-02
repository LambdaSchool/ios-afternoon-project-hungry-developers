//
//  Spoon.swift
//  ConcurrencyII - Hungry Devs
//
//  Created by Alex Rhodes on 10/2/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import Foundation

class Spoon {
    
    let identifier: Int
    
    var isPickedUp: Bool = false
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    private var lock = NSLock()
    
    func pickUp() {
        lock.lock()
        isPickedUp = true
    }
    
    func putDown() {
        lock.unlock()
        isPickedUp = false
    }
}
