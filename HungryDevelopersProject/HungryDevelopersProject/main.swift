//
//  main.swift
//  HungryDevelopersProject
//
//  Created by Bhawnish Kumar on 5/6/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import Foundation

class Spoon {
    static func pickUp() {
        print("Picked up spoon")
    }
    
    static func putDown() {
        print("Put down spoon")
    }
}

class Developer {
    let leftSpoon = ""
    let rightSpoon = ""
  
    
    static func run() {
        print("running")
        
          func eat() {
              print("eating")
          }
          
          func think() {
              print("thinking")
          }
    }
    
}
Developer.run()
