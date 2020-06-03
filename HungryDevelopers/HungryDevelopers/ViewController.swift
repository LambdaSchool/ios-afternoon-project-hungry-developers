//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Dahna on 6/3/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

var dev1 = Developer()
var dev2 = Developer()
var dev3 = Developer()
var dev4 = Developer()
var dev5 = Developer()

var spoon1 = Spoon()
var spoon2 = Spoon()
var spoon3 = Spoon()
var spoon4 = Spoon()
var spoon5 = Spoon()

class Spoon {
    
    func pickUp() {
        
    }
    
    func putDown() {
        
    }
}

class Developer {
    
    var leftSpoon = Spoon()
    var rightSpoon = Spoon()
    
    func think() {
        leftSpoon.pickUp()
        rightSpoon.pickUp()
    }
    
    func eat() {
        
    }
    
    func run() {
        think()
        eat()
    }
}

