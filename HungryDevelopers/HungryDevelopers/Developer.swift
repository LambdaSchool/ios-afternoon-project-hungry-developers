//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Fabiola S on 11/5/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

class Developer {
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var eating = true
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.rightSpoon = rightSpoon
        self.leftSpoon = leftSpoon
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickup()
            rightSpoon.pickup()
        } else {
            rightSpoon.pickup()
            leftSpoon.pickup()
        }
    }
    
    func eat() {
        print("\(name) is eating")
        usleep(1000000)
        leftSpoon.putDown()
        print("\(name) is putting down left spoon")
        rightSpoon.putDown()
        print("\(name) is putting down right spoon")
        
        eating = !eating
    }
    
    func run() {
        let running: Bool = true
        if running == true {
            think()
            eat()
            run()
        }
        
    }
}
