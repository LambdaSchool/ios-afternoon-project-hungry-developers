import UIKit

class Spoon {
    var isUp: Bool = false
    
    func pickUp(){
        if self.isUp == false {
            self.isUp = true
        } else {
            return }
    }
    
    func putDown(){
        if self.isUp == true {
            self.isUp = false
        } else {
            return }
    }
}



class Developer {
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var isEating: Bool = false
    
    
    init(_ leftSpoon: Spoon, _ rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think(){
        
    }
    
    func eat(){
        
    }
    
    func run(){
        
    }
}


//Spoons



//Devs
