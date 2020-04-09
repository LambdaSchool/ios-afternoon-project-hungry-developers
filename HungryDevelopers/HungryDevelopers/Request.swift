//
//  Request.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Request {
    
    // MARK: - Properties
    
    let developer: Developer
    var isFulfilled = false
    
    // MARK: - Init
    
    init(developer: Developer) {
        self.developer = developer
    }
}
