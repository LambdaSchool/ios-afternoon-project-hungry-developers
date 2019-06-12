//
//  Spoon.swift
//  Hungry-Developers
//
//  Created by Hector Steven on 6/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Spoon {
	init(name: String) {
		self.name = name
	}
	
	func pickUp() {
		spoonLock.lock()
	}
	
	func putDown() {
		spoonLock.unlock()
	}
	
	private let spoonLock = NSLock()
	var name: String
}


