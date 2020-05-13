//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Waseem Idelbi on 5/12/20.
//  Copyright © 2020 WaseemID. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - The spoons -
        
        let spoon1 = Spoon(name: "spoon 1", index: 1)
        let spoon2 = Spoon(name: "spoon 2", index: 2)
        let spoon3 = Spoon(name: "spoon 3", index: 3)
        let spoon4 = Spoon(name: "spoon 4", index: 4)
        let spoon5 = Spoon(name: "spoon 5", index: 5)
        
        //MARK: - The developers -
        
        let dev1 = Developer(name: "dev 1", leftSpoon: spoon1, rightSpoon: spoon5)
        let dev2 = Developer(name: "dev 2", leftSpoon: spoon2, rightSpoon: spoon1)
        let dev3 = Developer(name: "dev 3", leftSpoon: spoon3, rightSpoon: spoon2)
        let dev4 = Developer(name: "dev 4", leftSpoon: spoon4, rightSpoon: spoon3)
        let dev5 = Developer(name: "dev 5", leftSpoon: spoon5, rightSpoon: spoon4)
        
        var devs: [Developer] {
            var developers: [Developer] = []
            developers.append(dev1)
            developers.append(dev2)
            developers.append(dev3)
            developers.append(dev4)
            developers.append(dev5)
            return developers
        }
        
        //MARK: - Let's Eat! -
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            devs[$0].run()
        }
        
    } //End of the ViewDidLoad method
    
    
}

