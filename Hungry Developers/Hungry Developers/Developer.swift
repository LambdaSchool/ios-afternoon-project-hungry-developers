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
		rightSpoon.pickUp()
	}

	func eat() {
		usleep(5000)
	}

	func run() {
		think()
		eat()
	}
}
