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
	
	
	func createTableFor5() {
		[ "1.Hector", "2.Chris", "3.Micheal", "4.Josh", "5.Ben"].forEach( { createDev(name: $0) })
		
		for i in 1...5 {
			spoons.append(Spoon(name: "Spoon \(i)"))
		}
		
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
	
	func createTableFor4() {
		["1.Hector", "2.Chris", "3.Micheal", "4.Josh"].forEach( { createDev(name: $0) })
		
		for i in 0...3 {
			spoons.append(Spoon(name: "Spoon \(i)"))
		}
		
		developers[0].leftSpoon = spoons[3]
		developers[0].rightSpoon = spoons[0]
		
		developers[1].leftSpoon = developers[0].rightSpoon
		developers[1].rightSpoon = spoons[1]
		
		developers[2].leftSpoon = developers[1].rightSpoon
		developers[2].rightSpoon = spoons[2]
		
		developers[3].leftSpoon = developers[2].rightSpoon
		developers[3].rightSpoon = developers[0].leftSpoon
	}

	init() {
		createTableFor5()
//		createTableFor4()
		
		for dev in developers {
			let right = dev.rightSpoon
			let left = dev.leftSpoon
			print("\(dev.name) has access to: [\(left.name)] and  [\(right.name)]")
		}
	}
	
	var spoons: [Spoon] = []
	var developers: [Developer] = []
}

let main = Main()

DispatchQueue.concurrentPerform(iterations: 5) {
	main.developers[$0].run()
}

