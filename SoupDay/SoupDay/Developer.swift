//
//  Developer.swift
//  SoupDay
//
//  Created by Jeffrey Santana on 9/4/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class Developer {
	
	let name: String
	var bowlsEatten = 0
	var leftSpoon: Spoon
	var rightSpoon: Spoon
	
	init(id: String, lhs: Spoon, rhs: Spoon) {
		self.name = id
		leftSpoon = lhs
		rightSpoon = rhs
	}
	
	func think() {
		let spoons = [leftSpoon, rightSpoon].sorted(by: {$0.id < $1.id})
		for spoon in spoons {
			spoon.pickUp(by: name)
		}
	}
	
	func eat() {
		print("Dev \(name) started eating bowl #\(bowlsEatten)")
		
		let ms = 1000
		usleep(useconds_t(Int.random(in: 1...100) * ms))
		
		leftSpoon.putDown(by: name)
		rightSpoon.putDown(by: name)
		bowlsEatten += 1
	}
	
	func run() {
		while true {
			think()
			eat()
		}
	}
}
