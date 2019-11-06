//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Fabiola S on 11/5/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var devs: [Developer] = []
    
    // Developers
    let developer1 = Developer(name: "Developer One", leftSpoon: Spoon(index: 5), rightSpoon: Spoon(index: 1))
    let developer2 = Developer(name: "Developer Two", leftSpoon: Spoon(index: 1), rightSpoon: Spoon(index: 2))
    let developer3 = Developer(name: "Developer Three", leftSpoon: Spoon(index: 2), rightSpoon: Spoon(index: 3))
    let developer4 = Developer(name: "Developer Four", leftSpoon: Spoon(index: 3), rightSpoon: Spoon(index: 4))
    let developer5 = Developer(name: "Developer Five", leftSpoon: Spoon(index: 4), rightSpoon: Spoon(index: 5))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

