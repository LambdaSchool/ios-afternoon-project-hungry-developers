//
//  Classes.swift
//  HungryDevelopers
//
//  Created by Waseem Idelbi on 5/12/20.
//  Copyright © 2020 WaseemID. All rights reserved.
//

import UIKit

class Spoon {
    
    //MARK: - Properties -
    
    private let lock = NSLock()
    let name: String
    let index: Int
    
    //MARK: - Methods -
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
    
    init(name:String, index: Int) {
        self.name = name
        self.index = index
    }
    
}

class Developer {
    
    //MARK: - Properties -
    
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    //MARK: - Mehtods -
    
    func think() {
        
        let leftIndex = leftSpoon.index
        let rightIndex = rightSpoon.index
        
        if leftIndex < rightIndex {
            
            leftSpoon.pickUp()
            print("\(name) has picked up spoon number: \(leftSpoon.index)")
            rightSpoon.pickUp()
            print("\(name) has picked up spoon number: \(rightSpoon.index)")
            
        } else {
            
            rightSpoon.pickUp()
            print("\(name) has picked up spoon number: \(rightSpoon.index)")
            leftSpoon.pickUp()
            print("\(name) has picked up spoon number: \(leftSpoon.index)")
            
        }
        
        
        
    }
    
    func eat() {
        
        print("\(name) statrted eating")
        usleep(1)
        rightSpoon.putDown()
        leftSpoon.putDown()
        print("\(name) has put both spoons \(rightSpoon.index) and \(leftSpoon.index)")
        print("\(name) stopped eating")
        
    }
    
    func run() {
        
        while 1 == 1 {
            think()
            eat()
        }
        
    }
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
}
