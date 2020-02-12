//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Kenny on 2/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

class Spoon {
    private let lock = NSLock()
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}
