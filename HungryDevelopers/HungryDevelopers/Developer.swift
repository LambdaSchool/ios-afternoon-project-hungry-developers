//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class Developer {
    let spoons: Spoon
    let index: Int
    
    var leftIndex = -1
    var rightIndex = -1
    
    init(index: Int) {
        self.leftIndex = index
        self.rightIndex = index - 1
        
        if rightIndex < 0 {
            rightIndex += 5
        }
        
        self.spoons = Spoon(leftIndex: leftIndex, rightIndex: rightIndex)
        self.index = index
        
        print("Developer has an index of: \(self.index) left: \(leftIndex) right: \(rightIndex)")
    }
    
    func think() {
        spoons.pickUp()
    }
    
    func eat() {
        let timeToEat = UInt32.random(in: 1...10)
        print("Developer with index of \(self.index) is eating")
        usleep(timeToEat * 1_000_000)
        spoons.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}
