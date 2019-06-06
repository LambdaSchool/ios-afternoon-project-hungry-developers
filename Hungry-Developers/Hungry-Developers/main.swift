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
		[ "Hector", "Chris", "Micheal", "Josh", "Ben" ].forEach( { createDev(name: $0) })
	}
	
	func createTable() {
		/*
		
		<- [4: Ben] -> [spoon] <- [0: Hector] -> [spoon] <- [1: Chris] -> [spoon] <- [2: Micheal]-> [spoon] <- [3: Josh] -> [spoon] <- [4: Ben] ->[spoon] <- [0: Hector] -> [spoon]
		
		*/
		//developers[0].rightSpoon.name = "\(developers[1].name) right spoon"
		
		developers[4].leftSpoon = Spoon(name: "\(developers[4].name) and \(developers[0].name) shared spoon")
		developers[1].rightSpoon = Spoon(name: "\(developers[0].name) and \(developers[1].name) shared spoon")
		developers[0].seatAtTable(left: developers[4].leftSpoon, right: developers[1].rightSpoon)

		
//		developers[0].leftSpoon = Spoon(name: "\(developers[4].name) and \(developers[0].name)")
//		developers[2].rightSpoon = Spoon(name: "\(developers[4].name) and \(developers[0].name)")
//		developers[1].seatAtTable(left: developers[0].rightSpoon, right: developers[2].leftSpoon)
		
//
//		developers[1].leftSpoon = Spoon(name: "\(developers[1].name) right spoon")
//		developers[3].rightSpoon = Spoon(name: "\(developers[3].name) left spoon")
//		developers[2].seatAtTable(left: developers[1].leftSpoon, right: developers[3].rightSpoon)

		

//		developers[1].seatAtTable(left: developers[0].leftSpoon, right: developers[2].rightSpoon)
//		developers[1].leftSpoon.name = "\(developers[0].name) left spoon"
//		developers[1].rightSpoon.name = "\(developers[2].name) right spoon"
//
//
//		developers[2].seatAtTable(left: developers[1].leftSpoon, right: developers[3].rightSpoon)
//		developers[2].leftSpoon.name = "\(developers[1].name) left spoon"
//		developers[2].rightSpoon.name = "\(developers[3].name) right spoon"
//
//
//		developers[3].seatAtTable(left: developers[2].leftSpoon, right: developers[4].rightSpoon)
//		developers[3].leftSpoon.name = "\(developers[2].name) left spoon"
//		developers[3].rightSpoon.name = "\(developers[4].name) right spoon"
		
		
		
//		developers[4].seatAtTable(left: developers[3].leftSpoon, right: developers[0].rightSpoon)
//		developers[4].leftSpoon.name = "\(developers[3].name) left spoon"
//		developers[4].rightSpoon.name = "\(developers[0].name) right spoon"
		
	}

	init() {
		createDevs()
		createTable()
		
		for dev in developers {
			guard let right = dev.rightSpoon, let left = dev.leftSpoon else { return }
			print("\(dev.name) has acces to: \(left.name)'s and  \(right.name)'s")
		}
	}
	
	private (set) var developers: [Developer] = []
}

let main = Main()

//var i = 0
//let lock = NSLock()
//
//DispatchQueue.concurrentPerform(iterations: 5) { _ in
//	lock.lock()
//	print("\(i) ------------------")
//
//	i += 1
//
//	lock.unlock()
//}

