////
////  ArbiterSolution.swift
////  HungryDevelopers
////
////  Created by Lambda_School_Loaner_204 on 12/4/19.
////  Copyright © 2019 Lambda School. All rights reserved.
////
//
//import Foundation
//
//class Developer {
//
//    let dev: Int
//    let leftSpoon: Spoon
//    let rightSpoon: Spoon
//    let waiter: Waiter
//
//    init(_ num: Int, _ lhS: Spoon, _ rhS: Spoon, waiter: Waiter)
//    {
//        self.dev = num
//        self.leftSpoon = lhS
//        self.rightSpoon = rhS
//        self.waiter = waiter
//    }
//
//    func ask() {
//        waiter.permission()
//    }
//
//    func think() {
//        leftSpoon.pickUp()
//        print("Dev \(dev) picked up left spoon")
//        rightSpoon.pickUp()
//        print("Dev \(dev) picked up right spoon")
//        waiter.done()
//    }
//
//    func eat() {
//        let eatTime = Int.random(in: 1...100)
//        usleep(useconds_t(eatTime))
//        print("Dev \(dev) eating for: \(eatTime)")
//        rightSpoon.putDown()
//        print("Dev \(dev) put down right spoon")
//        leftSpoon.putDown()
//        print("Dev \(dev) put down left spoon")
//    }
//
//    func run() {
//        while true {
//            ask()
//            think()
//            eat()
//        }
//    }
//}
//
//class Waiter {
//
//    private let lock = NSLock()
//
//    func permission() {
//        lock.lock()
//    }
//
//    func done() {
//        lock.unlock()
//    }
//}
//
//
//let spoon1 = Spoon(index: 1)
//let spoon2 = Spoon(index: 2)
//let spoon3 = Spoon(index: 3)
//let spoon4 = Spoon(index: 4)
//let spoon5 = Spoon(index: 5)
//
//let waiter = Waiter()
//
//let dev1 = Developer(1, spoon1, spoon2, waiter: waiter)
//let dev2 = Developer(2, spoon2, spoon3, waiter: waiter)
//let dev3 = Developer(3, spoon3, spoon4, waiter: waiter)
//let dev4 = Developer(4, spoon4, spoon5, waiter: waiter)
//let dev5 = Developer(5, spoon5, spoon1, waiter: waiter)
//
//let developers = [dev1, dev2, dev3, dev4, dev5]
//
//DispatchQueue.concurrentPerform(iterations: 5) {
//    developers[$0].run()
//}
