//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Developer {
    
    // MARK: - Public
    
    let name: String
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    // MARK: - Init
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    // MARK: - Private
    
    private let leftSpoon: Spoon
    private let rightSpoon: Spoon
    
    private func think() {
        print("\(name) is now thinking and waiting to pick up spoons \n")
        
        jeeves.askPermissionToPickUpSpoons()
        leftSpoon.pickUp()
        print("\(name) has picked up spoon #\(leftSpoon.id) \n")
        rightSpoon.pickUp()
        print("\(name) has picked up spoon #\(rightSpoon.id) \n")
        jeeves.signalDonePickingUpSpoons()
    }
    
    private func eat() {
        print("\(name) is now eating \n")
        usleep(UInt32.random(in: 100_000...1_000_000))
        rightSpoon.putDown()
        print("\(name) has put down spoon #\(rightSpoon.id)")
        leftSpoon.putDown()
        print("\(name) has put down spoon #\(leftSpoon.id) \n")
    }
}
