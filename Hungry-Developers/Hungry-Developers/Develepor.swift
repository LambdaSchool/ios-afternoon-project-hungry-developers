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
	
	init(name: String) {
		self.name = name
	}
	
	var leftSpoon = Spoon(name: "left")
	var rightSpoon = Spoon(name: "right")
	
	
	func think() {
		sleeper()
		self.leftSpoon.pickUp()
		print("picked up left  spoon")
		
		sleeper()
		self.rightSpoon.pickUp()
		print("picked up right spoon")
		
		
	}
	
	func eat() {
		sleeper()
		self.leftSpoon.putDown()
		print("put down left  spoon")
		
		sleeper()
		self.rightSpoon.putDown()
		print("put down right spoon")

	}
	
	func run() {
		//should call think() then eat() over and over again forever.
		
		//while {1}
		think()
		eat()
	}
	
	
	private func sleeper() {
		let ran = useconds_t.random(in: 1_000_000...3_000_100)
		usleep(ran)
		//print(ran)
	}
	
}
