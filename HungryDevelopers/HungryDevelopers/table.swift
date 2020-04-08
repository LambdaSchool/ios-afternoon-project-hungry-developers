//
//  table.swift
//  HungryDevelopers
//
//  Created by Lambda_School_Loaner_268 on 3/11/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import Foundation

var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

var dev1 = Developer(leftSpoon: spoon5, rightSpoon: spoon1)
var dev2 = Developer(leftSpoon: spoon1, rightSpoon: spoon2)
var dev3 = Developer(leftSpoon: spoon2, rightSpoon: spoon3)
var dev4 = Developer(leftSpoon: spoon3, rightSpoon: spoon4)
var dev5 = Developer(leftSpoon: spoon4, rightSpoon: spoon5)

let devs = [dev1, dev2, dev3, dev4, dev5]
DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
