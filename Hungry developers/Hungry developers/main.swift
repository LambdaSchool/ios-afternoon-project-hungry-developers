//
//  main.swift
//  Hungry developers
//
//  Created by Kelson Hartle on 6/3/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation

class Spoon {
    
    let lock = NSLock()
    
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        lock.lock() 
    }
    
    func putDown() {
        lock.unlock()
        
    }
}

class Developer {
    
    let name: String
    let leftSpoon: Spoon //the spoons are the shared resource to use in the function
    let rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon, name: String){
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    
    func think() {
        //think() should pick up both spoons before returning.
        
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
        }
    }
    
    func eat() {
        usleep(2)
        
        leftSpoon.putDown()
        rightSpoon.putDown()
        
        print("Eating")
   
    }
    
    func run() {
        think()
        eat()
    }
}


let spoonOne = Spoon(index: 1)
let spoonTwo = Spoon(index: 2)
let spoonThree = Spoon(index: 3)
let spoonFour = Spoon(index: 4)
let spoonFive = Spoon(index: 5)

let devOne = Developer(leftSpoon: spoonOne, rightSpoon: spoonTwo, name: "devOne")
let devTwo = Developer(leftSpoon: spoonThree, rightSpoon: spoonFour, name: "devTwo")
let devThree = Developer(leftSpoon: spoonFour, rightSpoon: spoonFive, name: "devThree")
let devFour = Developer(leftSpoon: spoonOne, rightSpoon: spoonTwo, name: "devFour")
let devFive = Developer(leftSpoon: spoonThree, rightSpoon: spoonFour, name: "devFive")


let developersArray = [devOne,devTwo,devThree,devFour,devFive]

DispatchQueue.concurrentPerform(iterations: 5) {
    developersArray[$0].run()
    
}

