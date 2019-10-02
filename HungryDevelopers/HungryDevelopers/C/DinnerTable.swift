//
//  DinnerTable.swift
//  HungryDevelopers
//
//  Created by Nathan Hedgeman on 10/2/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation

//Properties
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let developer1 = Developer(name: "1", leftSpoon: spoon1, rightSpoon: spoon2)
let developer2 = Developer(name: "2", leftSpoon: spoon2, rightSpoon: spoon3)
let developer3 = Developer(name: "3", leftSpoon: spoon3, rightSpoon: spoon4)
let developer4 = Developer(name: "4", leftSpoon: spoon4, rightSpoon: spoon5)
let developer5 = Developer(name: "5", leftSpoon: spoon5, rightSpoon: spoon1)

let dinnerTable: [Developer] = [developer1, developer2, developer3, developer4, developer5]


