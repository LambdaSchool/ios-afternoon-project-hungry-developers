import UIKit

class Spoon {
    let id: Int
    var spoonLock = NSLock()
    var whoHasMe: UUID?
    
    init(_ id: Int) {
        self.id = id
    }
    
    func pickUp(){
        spoonLock.lock()
    }
       
    
    func putDown(){
        spoonLock.unlock()
    }
}



class Developer {
    
    let id = UUID()
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    let name: String
    
    
    
    init(_ leftSpoon: Spoon, _ rightSpoon: Spoon, name: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.name = name
    }
    
    func think(){
        leftSpoon.pickUp()
        leftSpoon.whoHasMe = self.id
        print("\(self.name) picked up \(leftSpoon.id)")
        
        rightSpoon.pickUp()
        rightSpoon.whoHasMe = self.id
        print("\(self.name) picked up \(rightSpoon.id)")
    }
    
    func eat(){
        if rightSpoon.whoHasMe == self.id && leftSpoon.whoHasMe == self.id {
            print("\(self.name) is eating")
            usleep(200_000)
            print("\(self.name) finished eating")
            leftSpoon.putDown()
            rightSpoon.putDown()
        } else {
            return
        }
    }
    
    func run(){
        while true {
            think()
            eat()
        }
    }
}


//Spoons
let spoon1 = Spoon(1)
let spoon2 = Spoon(2)
let spoon3 = Spoon(3)
let spoon4 = Spoon(4)
let spoon5 = Spoon(5)


//Devs
let dev1 = Developer(spoon1, spoon2, name: "Adam")
let dev2 = Developer(spoon2, spoon3, name: "Bob")
let dev3 = Developer(spoon3, spoon4, name: "Charlie")
let dev4 = Developer(spoon4, spoon5, name: "Donna")
let dev5 = Developer(spoon5, spoon1, name: "Edith")

let diningTable = [dev1, dev2, dev3, dev4, dev5]



DispatchQueue.concurrentPerform(iterations: 5) {
    print("\(diningTable[$0].name) has joined the meal.")
    diningTable[$0].run()
}

