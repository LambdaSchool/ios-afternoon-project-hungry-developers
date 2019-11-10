//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Joel Groomer on 11/7/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation
import UIKit

protocol SpoonDelegate: UIViewController {
    func updateLabel(for dev: Int)
}

class Spoon {
    let spoonID: Int
    var heldBy: Int { didSet { updateLabel() } }
    let lock = NSLock()
    var delegate: SpoonDelegate?
    
    init(id: Int, delegate: SpoonDelegate? = nil) {
        self.spoonID = id
        self.heldBy = 0
    }
    
    func pickUp(by dev: Int) {
        lock.lock()
        heldBy = dev
        print("spoon \(spoonID) picked up by dev \(dev).")
    }
    
    func putDown() {
        heldBy = 0
        print("spoon \(spoonID) put down.")
        lock.unlock()
    }
    
    func updateLabel() {
        print("hi")
        DispatchQueue.main.async {
            print("hi again")
            guard let delegate = self.delegate else { return }
            delegate.updateLabel(for: self.heldBy)
        }
    }
}
