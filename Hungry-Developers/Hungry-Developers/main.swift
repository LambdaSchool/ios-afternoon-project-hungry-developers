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
	
	func createDevs() {
		[ "Hector", "Chris", "Micheal", "Josh", "Ben"].forEach( { createDev(name: $0) })
	}
	
	func addDevToTable(dev: inout Developer, leftSpoon: Spoon, rightSpoon: Spoon) {
		dev.leftSpoon = rightSpoon
		dev.rightSpoon = leftSpoon
		
	}
	
	
	func createTable() {
		/*
		
		[4]-> <- [0] -> <- [1] -> <- [2]-> <- [3] -> <- [4] -> <- [0] ->
		
		*/
		
//		developers[0].leftSpoon = developers[4].rightSpoon
//		developers[0].rightSpoon = developers[1].leftSpoon

		addDevToTable(dev: &developers[0], leftSpoon: developers[0].leftSpoon,
					  rightSpoon: developers[1].rightSpoon)
		
	}
	
	
	
	
	
	init() {
		createDevs()
		createTable()
		print(developers[0].name, developers[0].rightSpoon.name, developers[0].leftSpoon.name)
	}
	
	private (set) var developers: [Developer] = []
}

let main = Main()

var i = 0
let lock = NSLock()

DispatchQueue.concurrentPerform(iterations: 5) { _ in
	lock.lock()
	print("\(i) ------------------")
	
	i += 1
	
	lock.unlock()
}

