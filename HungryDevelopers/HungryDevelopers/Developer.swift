//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Lambda_School_Loaner_259 on 4/8/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class Developer {
    
    // MARK: - Properties
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    // MARK: - Methods
    func think() {
        print("developer - \(self.name) - beginning to think.")
        let numberOfMicroSeconds: UInt32 = UInt32.random(in: 0..<500)
        usleep(numberOfMicroSeconds)
        leftSpoon.pickUp()
        leftSpoon.isInUse = true
        print("developer - \(self.name) - picked up left spoon.")
        rightSpoon.pickUp()
        rightSpoon.isInUse = true
        print("developer - \(self.name) - picked up right spoon.")
    }
    
    func eat() {
        print("developer - \(self.name) - beginning to eat.")
        let numberOfMicroSeconds: UInt32 = UInt32.random(in: 0..<500)
        usleep(numberOfMicroSeconds)
        rightSpoon.putDown()
        rightSpoon.isInUse = false
        print("developer - \(self.name) - put down right spoon.")
        leftSpoon.putDown()
        leftSpoon.isInUse = false
        print("developer - \(self.name) - put down left spoon.")
    }
    
    func run() {
        while true {
            think()
            print("developer - \(self.name) - done thinking.")
            eat()
            print("developer - \(self.name) - done eating.")
        }
    }
}
