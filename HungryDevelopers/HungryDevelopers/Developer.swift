//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Jonathan Ferrer on 6/12/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import Foundation

class Developer {

    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }

    func think() {
        rightSpoon.pickUp()
        leftSpoon.pickUp()

    }

    func eat() {
        let time = UInt32.random(in: 1...10)
        usleep(time)
        print("\(self.name) is eating")
        rightSpoon.putDown()
        leftSpoon.putDown()
    }

    func run() {
        while 1 == 1 {
            think()
            eat()
        }
    }

    let name: String




    var leftSpoon: Spoon
    var rightSpoon: Spoon

}
