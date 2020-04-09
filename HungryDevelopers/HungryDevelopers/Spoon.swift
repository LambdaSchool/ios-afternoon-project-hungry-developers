//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon: Equatable {
    
    // MARK: - Public
    
    var isDirty = true
    let id: Int
    
    func pickUp() {
        isDirty = false
    }
    
    func putDown() {
        isDirty = true
    }
    
    // MARK: - Init
    
    init(id: Int) {
        self.id = id
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: Spoon, rhs: Spoon) -> Bool {
        return lhs.id == rhs.id
    }
}
