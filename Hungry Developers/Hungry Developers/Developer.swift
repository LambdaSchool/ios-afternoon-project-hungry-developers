//
//  Developer.swift
//  Hungry Developers
//
//  Created by Percy Ngan on 10/30/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import Foundation

class Developer {

	var leftSpoon: Spoon
	var rightSpoon: Spoon

	init(leftSpoon: Spoon, rightSpoon: Spoon) {
		self.leftSpoon = leftSpoon
		self.rightSpoon = rightSpoon
	}

	func think() {
		leftSpoon.pickUp()
		print("Pickup left spoon")
		rightSpoon.pickUp()
		print("Pickup right spoon")
	}

	func eat() {
		print("Eating")
		usleep(5000)
		leftSpoon.putDown()
		rightSpoon.putDown()

	}

	func run() {
		think()
		eat()
	}
}
