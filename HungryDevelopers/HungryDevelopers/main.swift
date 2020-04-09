//
//  main.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

let jeeves = Waiter()

var spoons: [Spoon] = []

for i in 1...5 {
    spoons.append(Spoon(id: i))
}

let developerNames = ["A", "B", "C", "D", "E"]
var developers: [Developer] = []

for i in 0..<5 {
    developers.append(Developer(name: "Developer \(developerNames[i])", leftSpoon: spoons[i], rightSpoon: spoons[(i + 1) % spoons.count]))
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
