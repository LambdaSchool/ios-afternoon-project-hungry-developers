//
//  Spoon.swift
//  HungryDeveloper
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

class Spoon {
    
    var index: Int!
    
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
