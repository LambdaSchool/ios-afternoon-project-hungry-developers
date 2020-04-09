//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon {
    
    // MARK: -  Public
    
    let id: Int
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    // MARK: - Init
    
    init(id: Int) {
        self.id = id
    }
    
    // MARK: - Private
    
    private let lock = NSLock()
}
