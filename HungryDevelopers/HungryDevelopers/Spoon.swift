//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Gerardo Hernandez on 3/17/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import Foundation

var hasSpoon: Bool = false
var sharedResource = hasSpoon
let group = DispatchGroup()
let myQueue = DispatchQueue(label: "Shared Access Queue")
//let spoonCount = 5
//let developerCount = 5
//var index = 0

class Spoon {
    var index = 0
    
    init(index: Int) {
        self.index = index
    }
    
    func pickUp() {
        group.enter()
    }
    
    func putDown() {
        group.leave()
    }
}

class Developer {
    let name: String
    let leftSpoon: Spoon
    let rightSpoon: Spoon
    
    init(name: String, leftSppon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSppon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            rightSpoon.pickUp()
        } else {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
            return
        }
        
    }
    
    func eat() {
        usleep(32)
        leftSpoon.putDown()
        rightSpoon.putDown()
        print("Done eating")
        return
    }
    
    func run() {
        while sharedResource == true {
            think()
            eat()
        }
        
    }
}

var spoon1 = Spoon(index: 1),
spoon2 = Spoon(index: 2),
spoon3 = Spoon(index: 3),
spoon4 = Spoon(index: 4),
spoon5 = Spoon(index: 5)

let developer1 = Developer(name: "Bruce Wayne", leftSppon: spoon1, rightSpoon: spoon2),
developer2 = Developer(name: "Kobe Bryant", leftSppon: spoon2, rightSpoon: spoon3),
developer3 = Developer(name: "Johnny Hicks", leftSppon: spoon3, rightSpoon: spoon4),
developer4 = Developer(name: "Steven Berard", leftSppon: spoon4, rightSpoon: spoon5),
developer5 = Developer(name: "Luqmaan Khan", leftSppon: spoon5, rightSpoon: spoon1)


var developersArray: [Developer] = []
developersArray.append(developer1,developer2,developer3,developer4,developer5)
