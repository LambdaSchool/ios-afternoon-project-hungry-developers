//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Sal B Amer on 3/17/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Create a class called Spoon. It should have two methods, pickUp() and putDown()
    class Spoon {
        let lock = NSLock()
        let id: Int
        
        init(id: Int){
            self.id = id
        }
        
        func pickUp() {
            lock.lock()
        }
        
        func putDown() {
            lock.unlock()
        }
    }

    //  Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
    class Developer {
        
        var leftSpoon: Spoon?
        var rightSpoon: Spoon?
        var id: Int
        
        init(id: Int) {
            self.id = id
        }
        
        func think() {
            //think() should pick up both spoons before returning.
            guard let leftSpoon = leftSpoon,
                let rightSpoon = rightSpoon else { return }
        }
        
        func eat() {
            //should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
            usleep(100000)
            leftSpoon?.putDown()
            // print ?
            rightSpoon?.putDown()
            
        }
        
        func run() {
            //should call think() then eat() over and over again forever.
            while id <= 5 {
                think()
                eat()
            }
        }
        
    }

}

