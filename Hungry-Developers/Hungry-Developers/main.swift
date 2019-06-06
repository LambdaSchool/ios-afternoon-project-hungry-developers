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
	var spoons: [Spoon] = []
	
	func createDev(name: String) {
		let dev = Developer(name: name)
		developers.append(dev)
	}
	
	func createDevs() {
		[ "Hector", "Chris", "Micheal", "Josh", "Ben"].forEach( { createDev(name: $0) })
	}
	
	func createSpoons() {
		for i in 1...5 {
			spoons.append(Spoon(name: "Spoon \(i)"))
		}
	}
	
	func createTable() {
		developers[0].leftSpoon = spoons[4]
		developers[0].rightSpoon = spoons[0]
		
		developers[1].leftSpoon = developers[0].rightSpoon
		developers[1].rightSpoon = spoons[1]
		
		developers[2].leftSpoon = developers[1].rightSpoon
		developers[2].rightSpoon = spoons[2]
		
		developers[3].leftSpoon = developers[2].rightSpoon
		developers[3].rightSpoon = spoons[3]

		developers[4].leftSpoon = developers[3].rightSpoon
		developers[4].rightSpoon = developers[0].leftSpoon
	}

	init() {
		createDevs()
		createSpoons()
		createTable()
		
		for dev in developers {
			let right = dev.rightSpoon
			let left = dev.leftSpoon
			print("\(dev.name) has acces to: [\(left.name)] and  [\(right.name)]")
		}
	}
	
	var developers: [Developer] = []
}



let main = Main()
let developers = main.developers

DispatchQueue.concurrentPerform(iterations: 5) {
	developers[$0].run()
}

