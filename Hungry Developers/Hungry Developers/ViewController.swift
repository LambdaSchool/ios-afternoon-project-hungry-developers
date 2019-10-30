//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Percy Ngan on 10/30/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

	let developer1 = Developer(leftSpoon: Spoon(index: 5), rightSpoon: Spoon(index: 1))
	let developer2 = Developer(leftSpoon: Spoon(index: 1), rightSpoon: Spoon(index: 2))
	let developer3 = Developer(leftSpoon: Spoon(index: 2), rightSpoon: Spoon(index: 3))
	let developer4 = Developer(leftSpoon: Spoon(index: 3), rightSpoon: Spoon(index: 4))
	let developer5 = Developer(leftSpoon: Spoon(index: 4), rightSpoon: Spoon(index: 5))

	var developers: [Developer] = []




	override func viewDidLoad() {
		super.viewDidLoad()

		developers = [developer1, developer2, developer3, developer4, developer5]

		DispatchQueue.concurrentPerform(iterations: 5) {
			developers[$0].run()
			}
	}


}

