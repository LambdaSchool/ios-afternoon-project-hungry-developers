//
//  HungryDevelopers
//
//  Created by Ciara Beitel on 10/2/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import Foundation
import UIKit

class Spoon {
    
    private var lock = NSLock()
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        print("\(self.name) is picking up a spoon.")
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(self.name) is picking up the left spoon.")
        } else {
            rightSpoon.pickUp()
            print("\(self.name) is picking up the right spoon.")
        }
    }
    
    func eat() {
        usleep(1000000)
        print("\(self.name) started eating.")
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("\(self.name) stopped eating.")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

let spoon1 = Spoon(index: 1) // chris right, ciara left
let spoon2 = Spoon(index: 2) // ciara right, devan left
let spoon3 = Spoon(index: 3) // devan right, kayla left
let spoon4 = Spoon(index: 4) // kayla right, mattie left
let spoon5 = Spoon(index: 5) // mattie right, chris left

let ciara = Developer(name: "Ciara", leftSpoon: spoon1, rightSpoon: spoon2)
let devan = Developer(name: "Devan", leftSpoon: spoon2, rightSpoon: spoon3)
let kayla = Developer(name: "Kayla", leftSpoon: spoon3, rightSpoon: spoon4)
let matty = Developer(name: "Matty", leftSpoon: spoon4, rightSpoon: spoon5)
let chris = Developer(name: "Chris", leftSpoon: spoon5, rightSpoon: spoon1)

let developers: [Developer] = [ciara, devan, kayla, matty, chris]

func start() {
    DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
    }
}

start()
