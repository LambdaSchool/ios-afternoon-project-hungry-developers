//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Dennis Rudolph on 12/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let table = Table()
        
        table.go()
    }
}


class Spoon {
    let index: Int
    let lock = NSLock()
    
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
    
    var devNumber: Int
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(ls: Spoon, rs: Spoon, num: Int) {
        self.leftSpoon = ls
        self.rightSpoon = rs
        self.devNumber = num
    }
    
    func think() {
//        print("Developer \(devNumber) is thinking")
        
//        leftSpoon.pickUp()
//        rightSpoon.pickUp()
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        let start = Date()
        usleep(20000)
        let end = Date()
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("Dev \(devNumber) ate for  \(end.timeIntervalSince1970-start.timeIntervalSince1970) seconds")
    }
    
    func run() {
        let a = 1
        while a == 1 {
            think()
            eat()
        }
    }
}

class Table {
    var spoon1 = Spoon(index: 1)
    var spoon2 = Spoon(index: 2)
    var spoon3 = Spoon(index: 3)
    var spoon4 = Spoon(index: 4)
    var spoon5 = Spoon(index: 5)
    
        
    
    func go() {
        let developer1 = Developer(ls: spoon5, rs: spoon1, num: 1)
        let developer2 = Developer(ls: spoon1, rs: spoon2, num: 2)
        let developer3 = Developer(ls: spoon2, rs: spoon3, num: 3)
        let developer4 = Developer(ls: spoon3, rs: spoon4, num: 4)
        let developer5 = Developer(ls: spoon4, rs: spoon5, num: 5)

        let developers = [developer1, developer2, developer3, developer4, developer5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
        }
    }
}





























