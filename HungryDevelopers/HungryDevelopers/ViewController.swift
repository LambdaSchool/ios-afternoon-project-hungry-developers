//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Nathan Hedgeman on 10/2/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.concurrentPerform(iterations: 5) {
            dinnerTable[$0].run()
            //print("hello")
        }
    }


}

