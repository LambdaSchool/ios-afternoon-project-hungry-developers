//
//  Spoons.swift
//  HungryDevelopers
//
//  Created by Enzo Jimenez-Soto on 6/3/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation


class Spoon {
    let identifier: Int
    
    var isPickedUp: Bool = false
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    private var lock = NSLock()
    
    func pickUp() {
        lock.lock()
        isPickedUp = true
    }
    
    func putDown() {
        lock.unlock()
        isPickedUp = false
    }
    
}
