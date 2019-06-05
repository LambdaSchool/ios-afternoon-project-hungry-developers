//
//  main.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()

let dev1 = Developer(name: "Bob", id: 1, leftSpoon: spoon2, rightSpoon: spoon1)
let dev2 = Developer(name: "Steve", id: 2, leftSpoon: spoon3, rightSpoon: spoon2)
let dev3 = Developer(name: "Nancy", id: 3, leftSpoon: spoon4, rightSpoon: spoon3)
let dev4 = Developer(name: "Stacy", id: 4, leftSpoon: spoon5, rightSpoon: spoon4)
let dev5 = Developer(name: "Gregg", id: 5, leftSpoon: spoon1, rightSpoon: spoon5)

let developers = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) { index in
    developers[index].run()
}

