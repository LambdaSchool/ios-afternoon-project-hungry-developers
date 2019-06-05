//
//  Develepor.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Developer {
	let leftSpoon = Spoon()
	let rightSpoon = Spoon()
	
	
	func think() {
		//both spoons are held so think for a time
		
		let ran = useconds_t.random(in: 1_000_000...5_000_000)
		usleep(ran)

		self.leftSpoon.pickUp()
		self.rightSpoon.pickUp()
		print("picked up left and right spoon")
		
		
	}
	
	func eat() {
		// pause for a random amout of time then put spoons down
		//putDown()
		
		
		
		let ran = useconds_t.random(in: 1_000_000...5_000_000)
		usleep(ran)
		self.leftSpoon.putDown()
		self.rightSpoon.putDown()
		print("put down left and right spoon")

	}
	
	func run() {
		//should call think() then eat() over and over again forever.
		
		think()
		eat()
	}
	
}
