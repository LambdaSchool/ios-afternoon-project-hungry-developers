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
    
    func pickUp() -> Bool {
        return lock.try()
    }
    
    func putDown() {
        lock.unlock()
    }
}
