//
//  ViewController.swift
//  HungryDevelopers
//
//  Created by Waseem Idelbi on 7/14/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Methods -
    
    func startHungryDevelopers() {

        ///Properties
        let firstSpoon = Spoon(1)
        let secondSpoon = Spoon(2)
        let thirdSpoon = Spoon(3)
        let fourthSpoon = Spoon(4)
        let fifthSpoon = Spoon(5)
        
        let firstDev = Developer(leftSpoon: firstSpoon, rightSpoon: fifthSpoon, index: 1)
        let secondDev = Developer(leftSpoon: secondSpoon, rightSpoon: firstSpoon, index: 2)
        let thirdDev = Developer(leftSpoon: thirdSpoon, rightSpoon: secondSpoon, index: 3)
        let fourthDev = Developer(leftSpoon: fourthSpoon, rightSpoon: thirdSpoon, index: 4)
        let fifthDev = Developer(leftSpoon: fifthSpoon, rightSpoon: fourthSpoon, index: 5)
        
        let developers = [firstDev, secondDev, thirdDev, fourthDev, fifthDev]
        
        ///Functionality
        
        DispatchQueue.global().async {
            firstDev.run()
        }
        
        DispatchQueue.global().async {
            secondDev.run()
        }
        
        DispatchQueue.global().async {
            thirdDev.run()
        }
        
        DispatchQueue.global().async {
            fourthDev.run()
        }
        
        DispatchQueue.global().async {
            fifthDev.run()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startHungryDevelopers()
    }

} //End of class

