//
//  main.swift
//  Hungry Hungry Developers Developers Developers
//
//  Created by Michael Redig on 6/5/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation

func partOneSetup() -> [Developer] {
	let spoon1 = Spoon(index: 1)
	let spoon2 = Spoon(index: 2)
	let spoon3 = Spoon(index: 3)
	let spoon4 = Spoon(index: 4)
//	let spoon5 = Spoon(index: 5)

	let spencer = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Mr. Curtis")
	let woz = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "Woz")
	let paul = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Paul")
	let ben = Developer(leftSpoon: spoon4, rightSpoon: spoon1, name: "Ben")
//	let steveBalmer = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Steve Balmer") // DEVELOPERS DEVELOPERS DEVELOPERS DEVELOPERS

	let developers = [spencer, woz, paul, ben]
	return developers
}

func partOneRun() {
	let developers = partOneSetup()

	// fires only 4 threads, despite 5 developers
	DispatchQueue.concurrentPerform(iterations: developers.count) { thread in
		print("\(thread): starting \(developers[thread].name)'s train of thought.")
		developers[thread].run()
	}

//	// this starts 5 threads though...
//	DispatchQueue.concurrentPerform(iterations: developers.count) { thread in
//		print("\(thread): starting \(developers[thread].name)'s train of thought.")
//	}

//	let group = DispatchGroup()
//
//	print("starting...")
//	for thread in 0..<developers.count {
//		group.enter()
//		DispatchQueue.global().async {
//			print("\(thread): starting \(developers[thread].name)'s train of thought.")
//			developers[thread].run()
////			group.leave()
//		}
//	}
//	print("finished starting")

}


partOneRun()
