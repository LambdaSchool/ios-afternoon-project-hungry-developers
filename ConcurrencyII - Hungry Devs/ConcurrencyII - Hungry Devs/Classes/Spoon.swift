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
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    private var lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
