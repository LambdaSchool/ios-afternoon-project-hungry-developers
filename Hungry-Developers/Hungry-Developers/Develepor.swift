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
	
	/// will set left and right spoon respectively
	func seatAtTable(left: Spoon?, right: Spoon?) {
		if let left = left {
			leftSpoon = left
		}
		
		if let right = right {
			rightSpoon = right
		}
	}
	
	func think() {
		//guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
		
		print("\(name) is thinking 🤪")

		sleeper()
		leftSpoon.pickUp()
		sleeper()
		rightSpoon.pickUp()

		print("\(name) finished thinking 🤪🤪")
	}
	
	func eat() {
		//guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
		print("\(name) is eating 🤯")
		sleeper()
		leftSpoon.putDown()
		sleeper()
		rightSpoon.putDown()
		
		print("\(name) finished eating 🤯🤯")

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
	
	
	private func sleeper() {
		
		
		let ran = useconds_t.random(in: 1_450_000...12_000_100)
		usleep(ran)
		
	}
	
	private let lock = NSLock()
	let name: String
	
	var leftSpoon: Spoon = Spoon(name: "")
	var rightSpoon: Spoon = Spoon(name: "")
	
	
}
