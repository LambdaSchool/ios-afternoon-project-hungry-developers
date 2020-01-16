//
//  Developer.swift
//  Hungry Developers
//
//  Created by Alex Shillingford on 10/30/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        usleep(3)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    func run() {
        think()
        eat()
        run()
    }
}
