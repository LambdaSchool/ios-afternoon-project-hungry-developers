//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

// MARK: - Setup

let numberOfDevelopers = 5

var eats = [[Int]]()
var waitTimes = [[Double]]()

var spoons = [Spoon]()
for i in 0 ..< numberOfDevelopers {
    spoons.append(Spoon(i))
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

// MARK: - Run

for _ in 1...10 {
    DispatchQueue.concurrentPerform(iterations: developers.count + 1) {
        if $0 < developers.count {
            print("running \($0)")
            developers[$0].run()
        } else {
            // report stats per run
            sleep(2)
            for i in 0..<developers.count {
                developers[i].stop()
                
                let timeSinceLastLoop = Date().timeIntervalSinceReferenceDate - developers[i].loopStartTime.timeIntervalSinceReferenceDate
                waitTimes[i].append(timeSinceLastLoop)
                
                eats[i].append(developers[i].timesEaten)
                
                print("Dev \(i) ate:  \(developers[i].timesEaten)")
                print("Dev \(i) wait: \(timeSinceLastLoop)")
                
                if developers[i].timesEaten == 0 {
                    fatalError("dev \(i) didn't eat!!!")
                }
                developers[i].reset()
            }
        }
    }
}

// MARK: - Post-run Reporting

var averages = [Int]()

for i in 0 ..< numberOfDevelopers {
    var averageEats = 0
    for numEats in eats[i] {
        averageEats += numEats
    }
    averageEats /= eats[i].count
    
    var averageWaits = 0.0
    for numWaits in waitTimes[i] {
        averageWaits += numWaits
    }
    averageWaits /= Double(waitTimes[i].count)
    
    print("dev \(i) average eats:  \(averageEats)")
    print("dev \(i) average waits: \(averageWaits)")
    print("dev \(i) max wait:      \(waitTimes[i].max() ?? 0)")
}
