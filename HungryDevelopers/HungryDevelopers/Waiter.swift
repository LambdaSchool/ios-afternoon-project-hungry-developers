//
//  Waiter.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Waiter {
    
    // MARK: - Public
    
    func askPermissionToPickUpSpoons() {
        pickUpSpoonsLock.lock()
    }
    
    func signalDonePickingUpSpoons() {
        pickUpSpoonsLock.unlock()
    }
    
    // MARK: - Private
    
    private let pickUpSpoonsLock = NSLock()
}
