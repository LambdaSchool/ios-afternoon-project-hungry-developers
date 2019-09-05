//
//  main.swift
//  HungryDevelopers - Command Line
//
//  Created by Marlon Raskin on 9/4/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation

class Spoon {

	var id: Int
	let group = DispatchGroup()

	init(id: Int) {
		self.id = id
	}

	private let lock = NSLock()

	func pickup(by dev: String, leftOrRight: String) {
		lock.lock()
		print("\(leftOrRight) Spoon #\(id) was picked up by: \(dev)")

	}

	func putDown(by dev: String, leftOrRight: String) {
		print("\(leftOrRight) Spoon #\(id) was put down by: \(dev)")
		lock.unlock()
	}
}
