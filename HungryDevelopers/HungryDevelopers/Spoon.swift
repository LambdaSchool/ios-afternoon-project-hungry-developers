//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon: Equatable {
    init(id: Int) {
        self.id = id
    }
    
    var isDirty = true
    let id: Int
    
    func pickUp() {
        isDirty = false
        lock.lock()
    }
    
    func putDown() {
        isDirty = true
        lock.unlock()
    }
    
    static func ==(lhs: Spoon, rhs: Spoon) -> Bool {
        return lhs.id == rhs.id
    }
    
    private let lock = NSLock()
}
