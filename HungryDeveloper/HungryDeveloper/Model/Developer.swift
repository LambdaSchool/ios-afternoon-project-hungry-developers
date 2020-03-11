//
//  Developer.swift
//  HungryDeveloper
//
//  Created by Nick Nguyen on 3/11/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation


class Developer {
    
    var leftSpoon : Spoon
    var rightSpoon: Spoon
    var id: Int
    
    init(leftSpoon: Spoon,rightSpoon: Spoon,id : Int) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.id = id
    }
    
    func think() {
     
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("Dev \(id) picked up  left Spoon \(leftSpoon.index)")
            rightSpoon.pickUp()
            print("Dev \(id) up right Spoon \(rightSpoon.index)")
        } else {
            rightSpoon.pickUp()
            print("Dev\(id) picked up right Spoon. \(rightSpoon.index)")
            leftSpoon.pickUp()
            print("Dev \(id) picked up left Spoon.\(leftSpoon.index)")
        }
        
    }
    
    func eat() {
        print(" Dev \(id) start eating.")
        usleep(1000000)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print(" Dev \(id) finishing eating.")
    }
    
  func run() {
        while true {
            think()
            eat()
        }
    }

}




