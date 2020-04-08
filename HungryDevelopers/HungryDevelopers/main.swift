//
//  main.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Spoon {
    init(id: Int) {
        self.id = id
    }
    
    let id: Int
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    private let lock = NSLock()
}

class Waiter {
    func askPermissionToPickUpSpoons() {
        pickUpSpoonsLock.lock()
    }
    
    func signalDonePickingUpSpoons() {
        pickUpSpoonsLock.unlock()
    }
    
    private let pickUpSpoonsLock = NSLock()
}

let jeeves = Waiter()


class Developer {
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    let id: Int
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    func think() {
        print("Developer: \(id) is now thinking and waiting to pick up spoons \n")
        
        jeeves.askPermissionToPickUpSpoons()
        leftSpoon.pickUp()
        print("Developer: \(id) has picked up spoon #\(leftSpoon.id) \n")
        rightSpoon.pickUp()
        print("Developer: \(id) has picked up spoon #\(rightSpoon.id) \n")
        jeeves.signalDonePickingUpSpoons()
    }
    
    func eat() {
        print("Developer: \(id) is now eating \n")
        usleep(UInt32.random(in: 10...100))
        rightSpoon.putDown()
        print("Developer: \(id) has put down spoon #\(rightSpoon.id)")
        leftSpoon.putDown()
        print("Developer: \(id) has put down spoon #\(leftSpoon.id) \n")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}



var spoons: [Spoon] = []

for i in 1...5 {
    spoons.append(Spoon(id: i))
}

var developers: [Developer] = []

for i in 0..<5 {
    developers.append(Developer(id: i, leftSpoon: spoons[i], rightSpoon: spoons[(i + 1) % spoons.count]))
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
