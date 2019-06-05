//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class Developer {
    let name: String
    let id: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
//        print("\(name) picking up left spoon")
        leftSpoon.pickUp()
//        print("\(name) picking up right spoon")
        rightSpoon.pickUp()
    }
    
    func eat() {
        let timeToEat = UInt32.random(in: 1...10)
        print("\(name) is eating")
        usleep(timeToEat * 1_000_000)
//        print("\(name) putting down left spoon")
        leftSpoon.putDown()
//        print("\(name) putting downp right spoon")
        rightSpoon.putDown()
        usleep(timeToEat * 1_000_000)
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}
