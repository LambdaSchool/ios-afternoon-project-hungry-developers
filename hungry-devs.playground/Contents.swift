import Foundation

    //Create a class called Spoon. It should have two methods, pickUp() and putDown()
    class Spoon {
        let lock = NSLock()
        let id: Int
//        let group = DispatchGroup()
        
        init(id: Int){
            self.id = id
        }
        
        func pickUp() {
            lock.lock()
        }
        
        func putDown() {
            lock.unlock()
        }
    }

    //  Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
    class Developer {
        var name: String
        var leftSpoon: Spoon
        var rightSpoon: Spoon
//        var id: Int
        
        init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
            self.name = name
            self.rightSpoon = rightSpoon
            self.leftSpoon = leftSpoon
        }
        
        func think() {
            //think() should pick up both spoons before returning
            
            if leftSpoon.id < rightSpoon.id {
                leftSpoon.pickUp()
                print("\(name) picked up the left spoon")
            } else {
                rightSpoon.pickUp()
                print("\(name) picked up the right spoon")
            }
            return
        }
        
        func eat() {
            //should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
            print("\(name) has started eating")
            usleep(1_000_000)
            leftSpoon.putDown()
            rightSpoon.putDown()
             print("\(name) has stopped eating")
            
        }
        
        func run() {
            //should call think() then eat() over and over again forever.
            while true {
                think()
                eat()
            }
        }
        
    }
    // create 5 spoons and 5 developers
    
    let spoon1 = Spoon(id: 1)
    let spoon2 = Spoon(id: 2)
    let spoon3 = Spoon(id: 3)
    let spoon4 = Spoon(id: 4)
    let spoon5 = Spoon(id: 5)
    
    let sal = Developer(name: "Sal", leftSpoon: spoon1, rightSpoon: spoon2)
    let mark = Developer(name: "Mark", leftSpoon: spoon2, rightSpoon: spoon3)
    let sandy = Developer(name: "Sandy", leftSpoon: spoon3, rightSpoon: spoon4)
    let joey = Developer(name: "Joey", leftSpoon: spoon4, rightSpoon: spoon5)
    let chewy = Developer(name: "Chewy", leftSpoon: spoon5, rightSpoon: spoon1)
    
    let developersArray = [sal, mark, sandy, joey, chewy]
    
    
DispatchQueue.concurrentPerform(iterations: 5) {
developersArray[$0].run()
}
    
