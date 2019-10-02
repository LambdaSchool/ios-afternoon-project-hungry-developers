//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Nathan Hedgeman on 10/2/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation

class Spoon {
    
    //Properties
    private let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
