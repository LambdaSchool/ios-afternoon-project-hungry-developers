//
//  Spoon.swift
//  HungryDevelopersConcurrency
//
//  Created by Jessie Ann Griffin on 3/17/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
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

