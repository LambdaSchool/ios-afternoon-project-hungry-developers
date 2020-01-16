//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Alex Shillingford on 10/30/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class Spoon {
    var id: Int
    var isPickedUp: Bool = false
    private let spoonLock = NSLock()
    
    func pickUp() {
        spoonLock.lock()
        isPickedUp.toggle()
        print("Spoon is in use")
    }
    
    func putDown() {
        isPickedUp.toggle()
        spoonLock.unlock()
        print("Spoon is put down")
    }
    
    init(id: Int) {
        self.id = id
    }
}
