//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Gerardo Hernandez on 3/17/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import Foundation
import UIKit


class Spoon: Developer {
    
    static var hasSpoon: Bool = false
    var sharedResource = hasSpoon
    let group = DispatchGroup()
    let myQueue = DispatchQueue(label: "Shared Access Queue")
    let spoonCount = 5
    let developer = Developer()
//    var numberOfIterations = 0
    
    func pickUp() {
        
        for _ in 0..<spoonCount / developer.count {
            
            self.group.enter()
            
            myQueue.async {
                while self.sharedResource == true {
//                    self.numberOfIterations += 1
                    self.developer.eat()
                    
                    if self.sharedResource == false {
                        self.putDown()
                    }
                }
               self.group.leave()
            }
        }
    }
    
    
    func putDown() {
        
        for _ in 0..<developer.count / spoonCount {
            
            self.group.enter()
            
        myQueue.async {
            while self.sharedResource == false {
            self.developer.think()
                
                if self.sharedResource == true {
                    self.pickUp()
                }
            }
            self.group.leave()
            }
        }
    }
}

class Developer {
    let count = 5
    let leftSpoon: Bool = false
    let rightSpoon: Bool = false
    
    func think() {
        
    }
    
    func eat() {
        sleep(1)
    }
    
    func run() {
        
    }
}
