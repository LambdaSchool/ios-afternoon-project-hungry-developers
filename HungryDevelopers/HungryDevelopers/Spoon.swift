//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Gerardo Hernandez on 3/17/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import Foundation
import UIKit

 var hasSpoon: Bool = false
 var sharedResource = hasSpoon
 let group = DispatchGroup()
 let myQueue = DispatchQueue(label: "Shared Access Queue")
let spoonCount = 5
let developerCount = 5


class Spoon {
    
    let developer = Developer()
//    var numberOfIterations = 0
     
    
    func pickUp() {
        
        for _ in 0..<spoonCount / developerCount{
            
            group.enter()
            
            myQueue.async {
                while sharedResource == true {
//                    self.numberOfIterations += 1

                    self.developer.eat()
                    
                    if sharedResource == false {
                        self.putDown()
                        break
                    }
                }
               group.leave()
            }
        }
    }
    
    
    func putDown() {
        
        for _ in 0..<developerCount / spoonCount {
            
            group.enter()
            
        myQueue.async {
            while sharedResource == false {
            self.developer.think()
            
                
                if sharedResource == true {
                    self.pickUp()
                    break
                }
            }
            group.leave()
            }
        }
    }
}

class Developer {
   
    let leftSpoon: Bool = false
    let rightSpoon: Bool = false
    let spoon = Spoon()
    
    func think() {
        
        for _ in 0..<spoonCount / developerCount {
            group.enter()
            spoon.pickUp()
            group.leave()
            
            while leftSpoon.self && rightSpoon.self != true {
                group.enter()
                sharedResource = false
                spoon.putDown()
                
                if sharedResource == true {
                    spoon.pickUp()
                    break
                }
            }
        }
        
    }
    
    func eat() {
        sleep(1)
    }
    
    func run() {
        
    }
}
