//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Lambda_School_Loaner_268 on 3/11/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import Foundation



// MARK: - Dispatch Queue & Group

var eatingQueue = DispatchQueue(label: "Eating Serial Queue")
var eatingGroup = DispatchGroup()

// MARK: - Spoon

class Spoon {
    
    
    // MARK: - Properties
    var holder: Developer? = nil
    private var lock = NSLock()
    
    // MARK: - Methods
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}


// MARK: - Developer
class Developer {
    
    
    //MARK: - INIT
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    // MARK: - Properties
    private var lock = NSLock()
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    // MARK: - Methods
    func think() {
        let startTime = CA
     
            leftSpoon.pickUp()
            self.leftSpoon.holder = self
            self.rightSpoon.pickUp()
                self.rightSpoon.holder = self
                self.lock.unlock()
        }
    }
        return
}
    func eat() {
        usleep(1000)
        lock.lock()
        leftSpoon.putDown()
        rightSpoon.putDown()
        lock.unlock()
    }
    
    func run() {
        think()
        eat()
        }
    


