//
//  Spoon.swift
//  Hungry Hungry Developers Developers Developers
//
//  Created by Michael Redig on 6/5/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation

class Spoon {
	private let lock = NSLock()
	let index: Int

	init(index: Int) {
		self.index = index
	}

	func reachedFor(by developer: Developer) -> Bool {
		let pickedUp = lock.try()
		if pickedUp {
//			print("spoon \(index) UP (\(developer.name))")
			return true
		}
		return false
	}

	func pickUp(by developer: Developer) {
		lock.lock()
//		print("spoon \(index) UP (\(developer.name))")
	}

	func putDown(by developer: Developer) {
		lock.unlock()
//		print("spoon \(index) DOWN (\(developer.name))")
	}
}
