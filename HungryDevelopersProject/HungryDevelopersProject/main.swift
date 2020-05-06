//
//  main.swift
//  HungryDevelopersProject
//
//  Created by Bhawnish Kumar on 5/6/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import Foundation

class Spoon {
    private var lock = NSLock()
    
    var index = 0
    
    init(_ index: Int) {
        self.index = index
    }
    func pickUp() {
        print("Picked up spoon")
        lock.lock()
    }
    
     func putDown() {
        print("Put down spoon")
        lock.unlock()
    }
}

class Developer{
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func eat() {
        print("eating")
    }
    
    func think() {
        print("thinking")
    }

  func run() {
        print("running")
    while true {
        eat()
        think()
    }
    }
    
    func think() {
        
    }
    
}

