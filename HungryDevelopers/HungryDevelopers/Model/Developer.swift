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
        guard let leftSpoon = leftSpoon,
            let rightSpoon = rightSpoon
        else { return }
        
        let leftId = leftSpoon.id
        let rightId = rightSpoon.id
        
        if leftId < rightId {
            leftSpoon.pickUp()
            print("Developer \(id) picked up their left Spoon")
            rightSpoon.pickUp()
            print("Developer \(id) up their right Spoon")
        } else {
            rightSpoon.pickUp()
            print("Developer \(id) picked up their right Spoon")
            leftSpoon.pickUp()
            print("Developer \(id) picked up their left Spoon")
        }
        
    }
    
    func eat() {
        usleep(1_000_000)
        leftSpoon?.putDown()
        print("Developer \(id) put down their left spoon")
        rightSpoon?.putDown()
        print("Developer \(id) put down their right spoon")
    }
    
    func run() {
        while id <= 5 {
            think()
            eat()
        }
    }
}
