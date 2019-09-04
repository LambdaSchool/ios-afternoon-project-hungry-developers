import UIKit

class Spoon {

	let group = DispatchGroup()

	private let lock = NSLock()

	func pickup() {
		lock.lock()

	}

	func putDown() {

	}
}

class Developer {

	let devs = [DeveloperOne()]

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
