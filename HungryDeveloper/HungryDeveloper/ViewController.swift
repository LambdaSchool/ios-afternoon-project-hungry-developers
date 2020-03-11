//
//  ViewController.swift
//  HungryDeveloper
//
//  Created by Chris Gonzales on 3/11/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var idCount: Int = 0
        let spoon1 = Spoon()
        spoon1.index = 1
        let spoon2 = Spoon()
        spoon2.index = 2
        let spoon3 = Spoon()
        spoon3.index = 3
        let spoon4 = Spoon()
        spoon4.index = 4
        let spoon5 = Spoon()
        spoon5.index = 5
        
        let dev1 = Developer(leftSpoon: spoon1,
                             rightSpoon: spoon2,
                             id: &idCount)
        let dev2 = Developer(leftSpoon: spoon2,
                             rightSpoon: spoon3,
                             id: &idCount)
        let dev3 = Developer(leftSpoon: spoon3,
                             rightSpoon: spoon4,
                             id: &idCount)
        let dev4 = Developer(leftSpoon: spoon4,
                             rightSpoon: spoon5,
                             id: &idCount)
        let dev5 = Developer(leftSpoon: spoon5,
                             rightSpoon: spoon1,
                             id: &idCount)
        
        let developers = [dev1, dev2, dev3, dev4, dev5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }
    
    
}

class Spoon {
    
    private var lock = NSLock()
    var index: Int = 0
    var isDirty: Bool = true
    
    func pickUp(){
        lock.lock()
    }
    
    func putDown(){
        lock.unlock()
    }
}

class Developer {
    var leftSpoon = Spoon()
    var rightSpoon = Spoon()
    var id: Int = 0
    
    func think() {
        if leftSpoon.index < rightSpoon.index{
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
    }
    
    func eat() {
        print("start eating")
        usleep(1_000_000)
        print("finished eating")
        rightSpoon.putDown()
        leftSpoon.putDown()
    }
    
    func run() {
        let i = 0
        print("called run()")
        while i == 0 {
            think()
            print("call eat()")
            eat()
            print("finished eat()")
        }
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, id: inout Int) {
        let idCount = id + 1
        id = idCount
        self.id = idCount
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
}



