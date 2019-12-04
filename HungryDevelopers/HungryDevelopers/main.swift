//
//  main.swift
//  HungryDevelopers
//
//  Created by Jon Bash on 2019-12-04.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

let numberOfDevelopers = 5

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
}

for _ in 1...200 {
    DispatchQueue.concurrentPerform(iterations: developers.count + 1) {
        if $0 < developers.count {
            print("running \($0)")
            developers[$0].run()
        } else {
            usleep(100_000)
            for i in 0..<developers.count {
                developers[i].stop()
                print("Dev \(i) ate: \(developers[i].timesEaten)")
                if developers[i].timesEaten == 0 {
                    fatalError("dev \(i) didn't eat!!!")
                }
                developers[i].reset()
            }
            print("\n\n\n")
        }
    }
}
