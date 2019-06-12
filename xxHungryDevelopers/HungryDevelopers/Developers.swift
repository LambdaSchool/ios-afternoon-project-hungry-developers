//
//  Developers.swift
//  HungryDevelopers
//
//  Created by Sameera Roussi on 6/12/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import Foundation

class Developers {
    
    var leftSpoon = false
    var rightspoon = false
    var spoons: UInt8 = 0b00
    var reset = false
    
    func think() {
       let think = "💭"
        if (leftSpoon && rightspoon) {
            eat()
        }
    }
    
    func eat() {
        let eat = "🍔"
        
    }
    
    func run() {
        
        
    }
    
    
}


