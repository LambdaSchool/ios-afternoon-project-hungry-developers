//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Jonathan Ferrer on 6/12/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        developers = setUpDevelopers()

        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }



    func setUpDevelopers() -> [Developer] {
        let spoon1 = Spoon(1)
        let spoon2 = Spoon(2)
        let spoon3 = Spoon(3)
        let spoon4 = Spoon(4)
        let spoon5 = Spoon(5)

        let jon = Developer(leftSpoon: spoon1, rightSpoon: spoon2, name: "Jon")
        let james = Developer(leftSpoon: spoon2, rightSpoon: spoon3, name: "James")
        let ethel = Developer(leftSpoon: spoon3, rightSpoon: spoon4, name: "Ethel")
        let art = Developer(leftSpoon: spoon4, rightSpoon: spoon5, name: "Art")
        let lou = Developer(leftSpoon: spoon5, rightSpoon: spoon1, name: "Lou")
        return [jon, james, ethel, art, lou]
    }



       var developers: [Developer] = []

}

