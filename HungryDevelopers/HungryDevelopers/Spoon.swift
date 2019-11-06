//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Fabiola S on 11/5/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

class Spoon {
    let index: Int
    private var lock = NSLock()
    var pickedUp = false
    
    init(index: Int) {
        self.index = index
    }
    
    func pickup() {
        lock.lock()
        pickedUp = true
    }
    
    func putDown() {
        lock.unlock()
        pickedUp = false
    }
}
