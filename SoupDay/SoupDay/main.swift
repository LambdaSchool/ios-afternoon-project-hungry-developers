//
//  main.swift
//  SoupDay
//
//  Created by Jeffrey Santana on 9/4/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

var spoons = [Spoon]()

for index in 1...5 {
	spoons.append(Spoon(id: index))
}

let developers = [Developer(id: "Leo", lhs: spoons[0], rhs: spoons[1]),
				  Developer(id: "Don", lhs: spoons[1], rhs: spoons[2]),
				  Developer(id: "Raph", lhs: spoons[2], rhs: spoons[3]),
				  Developer(id: "Jeff", lhs: spoons[3], rhs: spoons[4]),
				  Developer(id: "Mike", lhs: spoons[4], rhs: spoons[0])]

DispatchQueue.concurrentPerform(iterations: 5) {
	developers[$0].run()
}
