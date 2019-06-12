//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Jonathan Ferrer on 6/12/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import Foundation

class Spoon {

    private let lock = NSLock()

    func pickUp() {
        lock.lock()
        
    }

    func putDown() {
        lock.unlock()
    }


}
