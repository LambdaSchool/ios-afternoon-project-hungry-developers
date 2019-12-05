//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

let numberOfDevelopers = 5

var eats = [[Int]]()
var waitTimes = [[Double]]()

var spoons = [Spoon]()
for _ in 0 ..< numberOfDevelopers {
    spoons.append(Spoon())
}

var developers = [Developer]()
for i in 0 ..< numberOfDevelopers {
    developers.append(Developer(
        id: i,
        lSpoon: spoons[i],
        rSpoon: spoons[(i + 1) % numberOfDevelopers]))
    eats.append([])
    waitTimes.append([])
}

for _ in 1...1000 {
    DispatchQueue.concurrentPerform(iterations: developers.count + 1) {
        if $0 < developers.count {
            print("running \($0)")
            developers[$0].run()
        } else {
            usleep(10_000)
            for i in 0..<developers.count {
                developers[i].stop()
                eats[i].append(developers[i].timesEaten)
                print("Dev \(i) ate: \(developers[i].timesEaten)")
                if developers[i].timesEaten == 0 {
                    fatalError("dev \(i) didn't eat!!!")
                }
                developers[i].reset()
            }
        }
    }
}

var averages = [Int]()

for i in 0 ..< numberOfDevelopers {
    var average = 0
    for numEats in eats[i] {
        average += numEats
    }
    average /= eats[i].count
    print("dev \(i) average: \(average)")
}
