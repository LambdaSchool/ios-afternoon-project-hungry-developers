//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class Spoon {
    private let lock = NSLock()
    let isDirty = true
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
