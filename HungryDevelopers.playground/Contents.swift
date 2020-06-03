import UIKit

class Spoon {
    var isUp: Bool = false
    
    func pickUp(){
        self.isUp = true
    }
    
    func putDown(){
        self.isUp = false
    }
}



class Developer {
    
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
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
