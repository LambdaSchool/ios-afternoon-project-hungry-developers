//
//  Table.swift
//  Hungry Developers
//
//  Created by Alex Shillingford on 1/15/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

let spoon1 = Spoon(id: 1)
let spoon2 = Spoon(id: 2)
let spoon3 = Spoon(id: 3)
let spoon4 = Spoon(id: 4)
let spoon5 = Spoon(id: 5)

let dev1 = Developer()
let dev2 = Developer()
let dev3 = Developer()
let dev4 = Developer()
let dev5 = Developer()

let developers = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
developers[$0].run()
}
