//
//  Spoon.swift
//  SoupDay
//
//  Created by Jeffrey Santana on 9/4/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import Foundation

class Spoon {
	
	private let lock = NSLock()
	let id: Int
	
	init(id: Int) {
		self.id = id
	}
	
	func pickUp(by dev: String) {
		lock.lock()
		print("Spoon #\(id) was picked up by \(dev)")
	}
	
	func putDown(by dev: String) {
		print("Spoon #\(id) was put down by \(dev)")
		lock.unlock()
	}
}
