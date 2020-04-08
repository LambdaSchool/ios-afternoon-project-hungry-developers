//
//  main.swift
//  HungryDevelopers
//
//  Created by Lambda_School_Loaner_259 on 4/8/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation
//import QuartzCore
//import Cocoa

class Table {
    let spoon1, spoon2, spoon3, spoon4, spoon5: Spoon
    let developer1, developer2, developer3, developer4, developer5: Developer
    let developers: [Developer]
    
    init() {
        spoon1 = Spoon()
        spoon2 = Spoon()
        spoon3 = Spoon()
        spoon4 = Spoon()
        spoon5 = Spoon()
        developer1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Developer1")
        developer2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Developer2")
        developer3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Developer3")
        developer4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Developer4")
        developer5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Developer5")
        developers = [developer1, developer2, developer3, developer4, developer5]
    }
    
    
    
    
}

let table = Table()

DispatchQueue.concurrentPerform(iterations: 5) {
    table.developers[$0].run()
}
