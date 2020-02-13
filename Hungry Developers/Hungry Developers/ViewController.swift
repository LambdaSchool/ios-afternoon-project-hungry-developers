//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Michael on 2/12/20.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dev1 = Developer(id: 1)
        let dev2 = Developer(id: 2)
        let dev3 = Developer(id: 3)
        let dev4 = Developer(id: 4)
        let dev5 = Developer(id: 5)
        let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
        
        let spoon1 = Spoon(id: 1)
        let spoon2 = Spoon(id: 2)
        let spoon3 = Spoon(id: 3)
        let spoon4 = Spoon(id: 4)
        let spoon5 = Spoon(id: 5)
        
        dev5.rightSpoon = spoon1
        
        dev1.leftSpoon = spoon1
        dev1.rightSpoon = spoon2
        
        dev2.leftSpoon = spoon2
        dev2.rightSpoon = spoon3
        
        dev3.leftSpoon = spoon3
        dev3.rightSpoon = spoon4
        
        dev4.leftSpoon = spoon4
        dev4.rightSpoon = spoon5
        
        dev5.leftSpoon = spoon5
        
        
        // Everything in here runs at the same time
        DispatchQueue.concurrentPerform(iterations: 5) { count in
            developers[count].run() // this runs once per developer
            
        }
    }
}

