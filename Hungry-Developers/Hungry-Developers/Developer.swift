//
//  Develepor.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Developer {

	init(name: String ) {
		self.name = name
	}
	
	func think() {
		sleeper {
			self.leftSpoon.pickUp()
			self.rightSpoon.pickUp()
			print("\(self.name) finished thinking 📝🍔")
		}
	}
	
	func eat() {
		sleeper{
			self.leftSpoon.putDown()
			self.rightSpoon.putDown()
			print("\(self.name) finished eating 🍔 📝")
		}
	}
	
	func run() {
		while true {
			self.think()
			self.eat()
		}
	}
	
	private func sleeper(completion: @escaping () -> ()) {
		let randomMicroseconds = useconds_t.random(in: 1_000_000...2_000_000)
		usleep(randomMicroseconds)
		completion()
	}
	
	private let lock = NSLock()
	let name: String
	var leftSpoon: Spoon = Spoon(name: "")
	var rightSpoon: Spoon = Spoon(name: "")
}
