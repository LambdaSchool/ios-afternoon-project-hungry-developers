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

	let name: String
	let rightSpoon: Spoon
	let leftSpoon: Spoon

	let lowerBoundmiliseconds =	700
	let upperBoundMiliseconds = 2000

	func think() {
		if leftSpoon.id < rightSpoon.id {
			leftSpoon.pickup(by: name, leftOrRight: "Left")
			rightSpoon.pickup(by: name, leftOrRight: "Right")
		} else {
			rightSpoon.pickup(by: name, leftOrRight: "Right")
			leftSpoon.pickup(by: name, leftOrRight: "Left")
		}
	}

	func eat() {
		usleep(useconds_t(Int.random(in: self.lowerBoundmiliseconds...self.upperBoundMiliseconds)) * 50)
		leftSpoon.putDown(by: name, leftOrRight: "Left")
		rightSpoon.putDown(by: name, leftOrRight: "Right")

	}

	func run() {
		while true {
			think()
			eat()
			usleep(1)
		}
	}
}
