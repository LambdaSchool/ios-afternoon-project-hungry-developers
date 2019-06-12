//
//  main.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

let gloabSemaphore = DispatchSemaphore(value: 0)

for index in 0...4 {
    DispatchQueue.global(qos: .background).async {
        let p = Developer(index: index)
        
        p.run()
    }
}

for semaphore in Spoon.spoonsSemophore {
    semaphore.signal()
}

gloabSemaphore.wait()

