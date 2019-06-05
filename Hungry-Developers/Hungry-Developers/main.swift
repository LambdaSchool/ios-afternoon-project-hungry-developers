//
//  main.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Main {
	
}

let devs: [Developer] = [Developer(), Developer(), Developer(), Developer(), Developer(),]

var i = 0
let lock = NSLock()

DispatchQueue.concurrentPerform(iterations: 5) { _ in
	lock.lock()
	print("\(i) ------------------")
	devs[i].run()
	i += 1
	lock.unlock()
}

