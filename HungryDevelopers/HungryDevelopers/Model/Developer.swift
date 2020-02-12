//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Kenny on 2/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func think() {
        print("Developer \(id) has left spoon: \(leftSpoon!.id) and right spoon: \(rightSpoon!.id)")
        
        leftSpoon?.pickUp()
        print("Developer \(id) picked up their left Spoon (Spoon #\(leftSpoon!.id))")
        rightSpoon?.pickUp()
        print("Developer \(id) up their right Spoon (Spoon #\(rightSpoon!.id))")
    }
    
    func eat() {
        let randomTime = useconds_t.random(in: 1000...3000)
        usleep(randomTime)
        
        leftSpoon?.putDown()
        print("I put down my left spoon")
        rightSpoon?.putDown()
        print("I put down my right spoon")
    }
    
    func run() {
        think()
        eat()
    }
}
