//
//  ViewController.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/7/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDev1: UILabel!
    @IBOutlet weak var lblDev2: UILabel!
    @IBOutlet weak var lblDev3: UILabel!
    @IBOutlet weak var lblDev4: UILabel!
    @IBOutlet weak var lblDev5: UILabel!
    
    let spoon1: Spoon
    let spoon2: Spoon
    let spoon3: Spoon
    let spoon4: Spoon
    let spoon5: Spoon
    let dev1: Developer
    let dev2: Developer
    let dev3: Developer
    let dev4: Developer
    let dev5: Developer
    let developers: [Developer]
    var dev1eatCount = 0
    var dev2eatCount = 0
    var dev3eatCount = 0
    var dev4eatCount = 0
    var dev5eatCount = 0
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//
//        dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon5)
//        dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon1)
//        dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon2)
//        dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon3)
//        dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon4)
//        developers = [dev1, dev2, dev3, dev4, dev5]
//
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
    
    required init?(coder: NSCoder) {
        spoon1 = Spoon(id: 1)
        spoon2 = Spoon(id: 2)
        spoon3 = Spoon(id: 3)
        spoon4 = Spoon(id: 4)
        spoon5 = Spoon(id: 5)
        dev1 = Developer(id: 1, leftSpoon: spoon1, rightSpoon: spoon5)
        dev2 = Developer(id: 2, leftSpoon: spoon2, rightSpoon: spoon1)
        dev3 = Developer(id: 3, leftSpoon: spoon3, rightSpoon: spoon2)
        dev4 = Developer(id: 4, leftSpoon: spoon4, rightSpoon: spoon3)
        dev5 = Developer(id: 5, leftSpoon: spoon5, rightSpoon: spoon4)
        developers = [dev1, dev2, dev3, dev4, dev5]
        
        super.init(coder: coder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spoon1.delegate = self
        spoon2.delegate = self
        spoon3.delegate = self
        spoon4.delegate = self
        spoon5.delegate = self
    }

    @IBAction func startTapped(_ sender: Any) {
        print("Starting...")
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }
}

extension ViewController: SpoonDelegate {
    
    func updateLabel(for dev: Int) {
        switch dev {
        case 1:
            self.dev1eatCount += 1
            self.lblDev1.text = "Dev 1 ate \(self.dev1eatCount) times"
        case 2:
            self.dev1eatCount += 1
            self.lblDev2.text = "Dev 2 ate \(self.dev2eatCount) times"
        case 3:
            self.dev1eatCount += 1
            self.lblDev3.text = "Dev 3 ate \(self.dev3eatCount) times"
        case 4:
            self.dev1eatCount += 1
            self.lblDev4.text = "Dev 4 ate \(self.dev4eatCount) times"
        case 5:
            self.dev1eatCount += 1
            self.lblDev5.text = "Dev 5 ate \(self.dev5eatCount) times"
        default:
            break
        }
    }
}

