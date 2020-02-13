//
//  Developer.swift
//  Hungry Developers
//
//  Created by Michael on 2/12/20.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    var id: Int
    
    init(id: Int, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    /// the think function
    func think() {
        guard
            let leftSpoonID = leftSpoon?.id,
            let rightSpoonID = rightSpoon?.id
            else { return }
        
//           MARK: - Developer 1
//         dev1.leftSpoon = spoon1
//         dev1.rightSpoon = spoon2
//           MARK: - Developer 2
//         dev2.leftSpoon = spoon2
//         dev2.rightSpoon = spoon3
//           MARK: - Developer 3
//         dev3.leftSpoon = spoon3
//         dev3.rightSpoon = spoon4
//           MARK: - Developer 4
//         dev4.leftSpoon = spoon4
//         dev4.rightSpoon = spoon5
//           MARK: - Developer 5
//         dev5.leftSpoon = spoon5
//         dev5.rightSpoon = spoon1
         
        if leftSpoonID < rightSpoonID {
            leftSpoon?.pickUp()
            print("Developer \(id) picked up their left spoon.")
            rightSpoon?.pickUp()
            print("Developer \(id) picked up their right spoon.")
        } else {
            rightSpoon?.pickUp()
            print("Developer \(id) picked up their right spoon.")
            leftSpoon?.pickUp()
            print("Developer \(id) picked up their left spoon.")
        }
    }
    
    func eat() {
        usleep(1_000_000)
        
        leftSpoon?.putDown()
        print("Developer \(id) put down their left spoon.")
        rightSpoon?.putDown()
        print("Developer \(id) put down their right spoon.")
    }
    
    func run() {
        while id <= 5 {
            think()
            eat()
        }
    }
}
