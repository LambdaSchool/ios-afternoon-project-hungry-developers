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
	
			//sleeper{
				//self.leftSpoon.pickUp()
			//	print("\(self.name) is thinking 📝")
			//}
			
			sleeper{
				self.rightSpoon.pickUp()
				self.leftSpoon.pickUp()
				print("\(self.name) finished thinking 📝🍔")
			}

	}
	
	func eat() {
		sleeper{
			self.leftSpoon.putDown()
			print("\(self.name) is eating 🍔")
		}
		
		sleeper{
			self.rightSpoon.putDown()
			print("\(self.name) finished eating 🍔 📝")
		}
	}
	
	/// run infinite loop
	func run() {
		let group = DispatchGroup()
		while true {
			group.enter()
			DispatchQueue.global().async {
				self.lock.lock()
				
				self.think()
				self.eat()
				
				self.lock.unlock()
				
				group.leave()
			}
		}
	}
	
	private func sleeper(completion: @escaping () -> ()) {
		let ran = useconds_t.random(in: 1_000_000...3_000_000)
		usleep(ran)
		completion()
		
	}
	
	private let lock = NSLock()
	let name: String
	var leftSpoon: Spoon = Spoon(name: "")
	var rightSpoon: Spoon = Spoon(name: "")
}
