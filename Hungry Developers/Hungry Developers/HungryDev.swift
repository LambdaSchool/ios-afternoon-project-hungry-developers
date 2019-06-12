//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Mitchell Budge on 6/12/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let spoon1 = Spoon()
        let spoon2 = Spoon()
        let spoon3 = Spoon()
        let spoon4 = Spoon()
        let spoon5 = Spoon()
        
        let dev1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
        let dev2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
        let dev3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
        let dev4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)
        let dev5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)
        let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }
    
    class Spoon {
        
        let lock = NSLock()
        var beingUsed: Bool = false
        
        func pickUp() {
            lock.lock()
            beingUsed = true
            print("spoon was picked up")
            lock.unlock()
        }
        
        func putDown() {
            lock.lock()
            beingUsed = false
            print("spoon was put down")
            lock.unlock()
        }
    }
    
    
    class Developer {
        
        var leftSpoon: Spoon
        var rightSpoon: Spoon
        var hasLeft: Bool
        var hasRight: Bool
        var runScenario: Bool = true
        
        init(leftSpoon: Spoon, rightSpoon: Spoon, hasLeft: Bool = false, hasRight: Bool = true) {
            self.leftSpoon = leftSpoon
            self.rightSpoon = rightSpoon
            self.hasLeft = hasLeft
            self.hasRight = hasRight
        }
        
        func think() {
            print("developer is thinking")
            if leftSpoon.beingUsed == false {
                leftSpoon.pickUp()
                hasLeft = true
            }
            if rightSpoon.beingUsed == false {
                rightSpoon.pickUp()
                hasRight = true
            }
            if hasLeft == true && hasRight == true {
                eat()
            }
            
        }
        
        func eat() {
            print("developer is eating")
            usleep(100)
            leftSpoon.putDown()
            rightSpoon.putDown()
        }
        
        func run() {
            print("running")
            if runScenario {
                while runScenario {
                    think()
                    eat()
                }
            }
        }
    }
}
