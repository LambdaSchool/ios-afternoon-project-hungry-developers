import UIKit

class Spoon {
    let id: Int
    private var spoonLock = NSLock()
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
        let lowPrioritySpoon: Spoon
        let highPrioritySpoon: Spoon
        
        if rightSpoon.id < leftSpoon.id {
            lowPrioritySpoon = rightSpoon
            highPrioritySpoon = leftSpoon
        } else {
            lowPrioritySpoon = leftSpoon
            highPrioritySpoon = rightSpoon
        }
        
        highPrioritySpoon.pickUp()
        highPrioritySpoon.whoHasMe = self.id
        print("\(self.name) picked up \(highPrioritySpoon.id)")
        
        lowPrioritySpoon.pickUp()
        lowPrioritySpoon.whoHasMe = self.id
        print("\(self.name) picked up \(lowPrioritySpoon.id)")
    }
    
    func eat(){
        if rightSpoon.whoHasMe == leftSpoon.whoHasMe {
            print("\(self.name) is eating")
            usleep(200_000)
            print("\(self.name) finished eating")
            leftSpoon.putDown()
            print("\(self.name) put down \(leftSpoon.id)")
            rightSpoon.putDown()
            print("\(self.name) put down \(rightSpoon.id)")
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


let newDev1 = Developer(spoon1, spoon2, name: "Anne")
let newDev2 = Developer(spoon2, spoon3, name: "Blanche")
let newDev3 = Developer(spoon3, spoon4, name: "Carla")
let newDev4 = Developer(spoon4, spoon5, name: "Diane")
let newDev5 = Developer(spoon5, spoon1, name: "Ellen")

let potluck = [newDev1, newDev2, newDev3, newDev4, newDev5]

//Group
let devGroup = DispatchGroup()

for dev in diningTable {
    devGroup.enter()
    DispatchQueue.global(qos: .background).async {
        dev.run()
    }
    devGroup.leave()
}

//
//DispatchQueue.concurrentPerform(iterations: 5) {
//    potluck[$0].run()
//}
//
//
//DispatchQueue.concurrentPerform(iterations: 5) {
//    print("\(diningTable[$0].name) has joined the meal.")
//    diningTable[$0].run()
//}




