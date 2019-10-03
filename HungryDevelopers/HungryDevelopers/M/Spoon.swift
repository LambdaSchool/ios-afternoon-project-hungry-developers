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
    let spoonNumber: Int
    
    init(spoonNumber: Int) {
        self.spoonNumber = spoonNumber
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
