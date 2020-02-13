//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Michael on 2/12/20.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

class Spoon {
    private var lock = NSLock()
    
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
