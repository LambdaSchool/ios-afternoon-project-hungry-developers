//
//  Spoon.swift
//  HungryDevelopers
//
//  Created by Waseem Idelbi on 7/14/20.
//  Copyright © 2020 Waseem Idelbi. All rights reserved.
//

import Foundation

class Spoon {
    
    //MARK: - Properties
    
    private let spoonLock = NSLock()
    let index: Int
    
    //MARK: - Methods
    
    func pickUp() {
        spoonLock.lock()
        print("\(index) UP")
    }
    
    func putDown() {
        spoonLock.unlock()
        print("\(index) down")
    }
    
    init(_ index: Int) {
        self.index = index
    }
    
} //End of class
