//
//  Develepor.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Developer {
	
	let name: String
	
	var leftSpoon: Spoon = Spoon(name: "")
	var rightSpoon: Spoon = Spoon(name: "")
	
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
		
		sleeper()
		leftSpoon.pickUp()
		print("picked up left  spoon")
		
		sleeper()
		rightSpoon.pickUp()
		print("picked up right spoon")
	}
	
	func eat() {
		//guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else { return }
		
		sleeper()
		leftSpoon.putDown()
		print("put down left  spoon")
		
		sleeper()
		rightSpoon.putDown()
		print("put down right spoon")

	}
	
	/// run infinite loop
	func run() {
		while true {
			think()
			eat()
		}
	}
	
	
	private func sleeper() {
		let ran = useconds_t.random(in: 1_000_000...3_000_100)
		usleep(ran)
		//print(ran)
	}
	
}
