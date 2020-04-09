//
//  main.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation


let interactionQueue = DispatchQueue(label: "Interaction Queue")

var spoonsOnTable: [Spoon] = []

for i in 0..<5 {
    spoonsOnTable.append(Spoon(id: i))
}

var developers: [Developer] = []

for i in 0..<5 {
    let nextDev = Developer(id: i)
    nextDev.spoonsInPossession.append(spoonsOnTable[i])
    developers.append(nextDev)
}

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

