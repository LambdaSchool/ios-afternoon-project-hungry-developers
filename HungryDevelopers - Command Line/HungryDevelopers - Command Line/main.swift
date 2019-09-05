//
//  Main.swift
//  HungryDevelopers - Command Line
//
//  Created by Marlon Raskin on 9/4/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation

let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)
let spoon5 = Spoon(id: 5)


let bobby = Developer(name: "Bobby", rightSpoon: spoon1, leftSpoon: spoon2)
let jonny = Developer(name: "Johnny", rightSpoon: spoon2, leftSpoon: spoon3)
let paul = Developer(name: "Paul", rightSpoon: spoon3, leftSpoon: spoon4)
let noah = Developer(name: "Noah", rightSpoon: spoon4, leftSpoon: spoon5)
let james = Developer(name: "James", rightSpoon: spoon5, leftSpoon: spoon1)

let developers = [bobby, jonny, paul, noah, james]

DispatchQueue.concurrentPerform(iterations: 5) {
	usleep(useconds_t(Int.random(in: 1...10)))
	developers[$0].run()
}
