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
	
	let timerRange = 0.01...0.053455
	
	func think() {
		//both spoons are held so think for a time
		
		self.leftSpoon.pickUp()
		self.rightSpoon.pickUp()
		let ran = Double.random(in: timerRange)
		
		let _ = Timer.init(timeInterval: ran, repeats: true) { (_) in
			self.eat()
		}
	}
	
	func eat() {
		// pause for a random amout of time then put spoons down
		//putDown()
		let ran = Double.random(in: timerRange)
		
		let _ = Timer.init(timeInterval: ran, repeats: true) { _ in
			self.leftSpoon.putDown()
			self.rightSpoon.putDown()
		}
	}
	
	func run() {
		//should call think() then eat() over and over again forever.
		
		think()
		eat()
	}
	
}
