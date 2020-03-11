//
//  ViewController.swift
//  HungryDeveloper
//
//  Created by Nick Nguyen on 3/11/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spoon1 = Spoon(index: 1)
        let spoon2 = Spoon(index: 2)
        let spoon3 = Spoon(index: 3)
        let spoon4 = Spoon(index: 4)
        let spoon5 = Spoon(index: 5)
        
        let dev1 = Developer(leftSpoon: spoon1, rightSpoon: spoon2,id: 1)
        let dev2 = Developer(leftSpoon: spoon2, rightSpoon: spoon3,id: 2)
        let dev3 = Developer(leftSpoon: spoon3, rightSpoon: spoon4,id: 3)
        let dev4 = Developer(leftSpoon: spoon4, rightSpoon: spoon5,id: 4)
        let dev5 = Developer(leftSpoon: spoon5, rightSpoon: spoon1,id: 5)
        
        let developers = [dev1,dev2,dev3,dev4,dev5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
        }
    }


}

