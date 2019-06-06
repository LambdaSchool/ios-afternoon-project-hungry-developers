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
	private (set) var leftSpoon: Spoon?
	private (set) var rightSpoon: Spoon?
	
	init(name: String ) {
		self.name = name
	}
	
	
	func setLeftRightSpoon(leftName: String, rightName: String) {
		leftSpoon = Spoon(name: leftName)
		rightSpoon = Spoon(name: rightName)
	}

	
	func think() {
		guard let leftSpoon = leftSpoon else { return }
		guard let rightSpoon = rightSpoon else { return }
		
		sleeper()
		leftSpoon.pickUp()
		print("picked up left  spoon")
		
		sleeper()
		rightSpoon.pickUp()
		print("picked up right spoon")
		
		
	}
	
	func eat() {
		guard let leftSpoon = leftSpoon else { return }
		guard let rightSpoon = rightSpoon else { return }
		sleeper()
		leftSpoon.putDown()
		print("put down left  spoon")
		
		sleeper()
		rightSpoon.putDown()
		print("put down right spoon")

	}
	
	/// run infinite loop
	func run() {
		//should call think() then eat() over and over again forever.
		
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
