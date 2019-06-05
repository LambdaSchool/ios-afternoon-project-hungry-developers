//
//  main.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

/*Create 5 Spoons and 5 Developers giving each developer a
left and right spoon. Note that developers will of course share
spoons. Ever developer's right spoon is the next developer's left spoon.
*/










class Main {
	
	func createDev(name: String) {
		let dev = Developer(name: name)
		developers.append(dev)
	}
	
//	func AddDeveloperToTable(dev: Developer, left: Spoon, rightt: Spoon) {
//
//	}
	
	func createDevs() {
		createDev(name: "Hector")
		createDev(name: "Chris")
		createDev(name: "Micheal")
		createDev(name: "Josh")
		createDev(name: "Ben")
	}
	
	init() {
		createDevs()
	}
	
	private (set) var developers: [Developer] = []
}






var i = 0
let lock = NSLock()

DispatchQueue.concurrentPerform(iterations: 5) { _ in
	lock.lock()
	print("\(i) ------------------")
	
	i += 1
	
	lock.unlock()
}

