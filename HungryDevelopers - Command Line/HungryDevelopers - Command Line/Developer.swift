//
//  Developer.swift
//  HungryDevelopers - Command Line
//
//  Created by Marlon Raskin on 9/4/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation

class Developer {

	init(name: String, rightSpoon: Spoon, leftSpoon: Spoon) {
		self.name = name
		self.rightSpoon = rightSpoon
		self.leftSpoon = leftSpoon
	}

//	let spoon = Spoon()
	var name: String
	var rightSpoon: Spoon
	var leftSpoon: Spoon

	let lowerBoundmiliseconds =	700
	let upperBoundMiliseconds = 2000

	func think() {
		
		leftSpoon.pickup(by: name, leftOrRight: "Left")
		rightSpoon.pickup(by: name, leftOrRight: "Right")
	}

	func eat() {
		usleep(useconds_t(Int.random(in: self.lowerBoundmiliseconds...self.upperBoundMiliseconds)) * 50)
		leftSpoon.putDown(by: name, leftOrRight: "Left")
		rightSpoon.putDown(by: name, leftOrRight: "Right")
	}

	func run() {
		think()
		eat()
	}
}
