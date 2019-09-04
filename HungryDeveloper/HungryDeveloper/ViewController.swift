//
//  ViewController.swift
//  HungryDeveloper
//
//  Created by Bradley Yin on 9/4/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let developers = [Developer(), Developer(), Developer(), Developer(), Developer()]
    let spoons = [Spoon(), Spoon(), Spoon(), Spoon(), Spoon()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, developer) in developers.enumerated() {
            if index < 4 {
                developer.rightSpoon = spoons[index]
                developer.leftSpoon = spoons[index + 1]
            } else if index == 4 {
                developer.rightSpoon = spoons[index]
                developer.leftSpoon = spoons[0]
            }
            
        }
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            
            developers[$0].run()
        }
        // Do any additional setup after loading the view.
    }


}

