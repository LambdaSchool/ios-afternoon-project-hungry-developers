//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Lambda_School_Loaner_259 on 4/8/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class Spoon {
    var isInUse: Bool = false
    private let lock = NSLock()
    
    func pickUp() {
        if isInUse {
            lock.lock()
            print("spoon - \(self) - locked")
        } else {
            lock.unlock()
            print("spoon - \(self) - unlocked")
        }
    }
    
    func putDown() {
        print("spoon - \(self) - put down")
    }
}
