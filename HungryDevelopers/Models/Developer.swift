//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Waseem Idelbi on 7/14/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import Foundation

class Developer {
    
    //MARK: - Properties
    
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    let index: Int
    
    //MARK: - Methods
    
    func think() {
        
        if leftSpoon.index < rightSpoon.index {
            
            leftSpoon.pickUp()
            rightSpoon.pickUp()
            
        } else if rightSpoon.index < leftSpoon.index {
            
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        
    }
    
    func eat() {
        print("Developer number \(index) started eating")
        usleep(1000000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Developer number\(index) finished eating")
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, index: Int) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.index = index
    }
    
} //End of class
