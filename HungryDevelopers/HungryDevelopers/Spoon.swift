//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Christopher Aronson on 6/5/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class Spoon {
    
    static let spoonsSemophore: [DispatchSemaphore] = Array(repeating: DispatchSemaphore(value: 1), count: 5)
    
    let leftSpoon: DispatchSemaphore
    let rightSpoon: DispatchSemaphore
    
    init(leftIndex: Int, rightIndex: Int) {
        if leftIndex > rightIndex {
            leftSpoon = Spoon.spoonsSemophore[leftIndex]
            rightSpoon = Spoon.spoonsSemophore[rightIndex]
        } else {
            leftSpoon = Spoon.spoonsSemophore[rightIndex]
            rightSpoon = Spoon.spoonsSemophore[leftIndex]
        }
    }
    
    func pickUp() {
        leftSpoon.wait()
        rightSpoon.wait()
    }
    
    func putDown() {
        leftSpoon.signal()
        rightSpoon.signal()
    }
}
