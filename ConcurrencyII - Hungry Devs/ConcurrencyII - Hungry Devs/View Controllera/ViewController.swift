//
//  ViewController.swift
//  ConcurrencyII - Hungry Devs
//
//  Created by Alex Rhodes on 10/2/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dev1Label: UILabel!
    @IBOutlet weak var dev2Label: UILabel!
    @IBOutlet weak var dev3Label: UILabel!
    @IBOutlet weak var dev4Label: UILabel!
    @IBOutlet weak var dev5Label: UILabel!
    
    @IBOutlet weak var spoon1Label: UILabel!
    @IBOutlet weak var spoon2Label: UILabel!
    @IBOutlet weak var spoon3Label: UILabel!
    @IBOutlet weak var spoon4Label: UILabel!
    @IBOutlet weak var spoon5Label: UILabel!
    
    let dev1 = Developer(name: "Dev1", leftSpoon: Spoon(identifier: 5), rightSpoon: Spoon(identifier: 1))
    let dev2 = Developer(name: "Dev2", leftSpoon: Spoon(identifier: 1), rightSpoon: Spoon(identifier: 2))
    let dev3 = Developer(name: "Dev3", leftSpoon: Spoon(identifier: 2), rightSpoon: Spoon(identifier: 3))
    let dev4 = Developer(name: "Dev4", leftSpoon: Spoon(identifier: 3), rightSpoon: Spoon(identifier: 4))
    let dev5 = Developer(name: "Dev5", leftSpoon: Spoon(identifier: 4), rightSpoon: Spoon(identifier: 5))

    var developers: [Developer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        [dev1, dev2, dev3, dev4, dev5].forEach { index in
            developers.append(index)
        }
        
        DispatchQueue.concurrentPerform(iterations: 5) {
        developers[$0].run()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setViews() {
        
    }
}
