//
//  Spoon.swift
//  HungryDeveloper
//
//  Created by Nick Nguyen on 3/11/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation




class Spoon {
    
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    
}
