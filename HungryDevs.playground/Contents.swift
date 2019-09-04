import UIKit

class Spoon {

	func pickup() {
		
	}

	func putDown() {

	}
}

class Developer {
	let lock = NSLock()
	let group = DispatchGroup()
	let spoon = Spoon()

	init(rightSpoon: Bool = false, leftSpoon: Bool = false) {
		self.rightSpoon = rightSpoon
		self.leftSpoon = leftSpoon
	}


	var rightSpoon: Bool = false
	var leftSpoon: Bool = false

	func think() {
		spoon.pickup()
	}

	func eat() {

	}

	func run() {

	}
}
