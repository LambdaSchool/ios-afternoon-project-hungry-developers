//
//  Developer.swift
//  Hungry Hungry Developers Developers Developers
//
//  Created by Michael Redig on 6/5/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation


class Developer {
	let leftSpoon: Spoon
	let rightSpoon: Spoon
	let name: String
	var iteration: Int = 0
	var giveUps: Int = 0

	init(leftSpoon: Spoon, rightSpoon: Spoon, name: String) {
		self.leftSpoon = leftSpoon
		self.rightSpoon = rightSpoon
		self.name = name
	}

	func think() {
		var spoons = [leftSpoon, rightSpoon]
		let rand = Int.random(in: 0...1)
		pickUpSpoon(spoons.remove(at: rand))
		for _ in 0...1000 {
			let success = spoons[0].reachedFor(by: self)
			if success {
				eat()
				return
			} else {
				usleep(50)
			}
		}
		giveUp()
	}

	private func pickUpSpoon(_ spoon: Spoon) {
		spoon.pickUp(by: self)
	}

	func eat() {
		iteration += 1
		let value = UInt32.random(in: 30_000...50_000)
		usleep(value)
		print("\(name): Yum yum yum! I ate and thought for \(value) microseconds. ...Until next time! \(iteration)")
		rightSpoon.putDown(by: self)
		leftSpoon.putDown(by: self)
	}

	func giveUp() {
		giveUps += 1
		print("\(name): C'mon guys... Share! \(giveUps)")
		rightSpoon.putDown(by: self)
		leftSpoon.putDown(by: self)
	}

	func run() {
		while true {
			think()
			usleep(1)
		}
	}
}
