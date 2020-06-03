import UIKit

class Spoon {
    var isUp: Bool = false
    var spoonLock = NSLock()
    
    func pickUp(){
        if self.isUp == false {
            spoonLock.lock()
            self.isUp = true
        } else {
            return }
    }
    
    func putDown(){
        if self.isUp == true {
            self.isUp = false
            spoonLock.unlock()
        } else {
            return }
    }
}



class Developer {
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    let name: String
    var isEating: Bool = false
    
    
    
    init(_ leftSpoon: Spoon, _ rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think(){
        if !leftSpoon.isUp && !rightSpoon.isUp {
            rightSpoon.pickUp()
            leftSpoon.pickUp()
        }
        return
    }
    
    func eat(){
        isEating = true
        if rightSpoon.isUp && leftSpoon.isUp {
            print("\(self.name) is eating")
            usleep(200_000)
            leftSpoon.putDown()
            rightSpoon.putDown()
            print("\(self.name) finished eating")
        }
        isEating = false
        
    }
    
    func run(){
        while true {
            think()
            eat()
        }
    }
}


//Spoons
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()
let spoon5 = Spoon()


//Devs
let dev1 = Developer(spoon1, spoon2, name: "Adam")
let dev2 = Developer(spoon2, spoon3, name: "Bob")
let dev3 = Developer(spoon3, spoon4, name: "Charlie")
let dev4 = Developer(spoon4, spoon5, name: "Donna")
let dev5 = Developer(spoon5, spoon1, name: "Edith")

let diningTable = [dev1, dev2, dev3, dev4, dev5]

DispatchQueue.concurrentPerform(iterations: 5) {
    diningTable[$0].run()
}
