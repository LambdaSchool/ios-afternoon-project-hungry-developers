import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spoon1 = Spoon(index: 1)
        let spoon2 = Spoon(index: 2)
        let spoon3 = Spoon(index: 3)
        let spoon4 = Spoon(index: 4)
        let spoon5 = Spoon(index: 5)
        
        let dev1 = Developer(name: "Mitch", leftSpoon: spoon1, rightSpoon: spoon2)
        let dev2 = Developer(name: "Kobe", leftSpoon: spoon2, rightSpoon: spoon3)
        let dev3 = Developer(name: "Nelson", leftSpoon: spoon3, rightSpoon: spoon4)
        let dev4 = Developer(name: "Hayden", leftSpoon: spoon4, rightSpoon: spoon5)
        let dev5 = Developer(name: "Julian", leftSpoon: spoon5, rightSpoon: spoon1)
        let developers: [Developer] = [dev1, dev2, dev3, dev4, dev5]
        
        DispatchQueue.concurrentPerform(iterations: 5) {
            developers[$0].run()
        }
    }
    
    class Spoon {
        
        let lock = NSLock()
        var index: Int
        
        init(index: Int) {
            self.index = index
        }
        
        func pickUp() {
            lock.lock()
        }
        
        func putDown() {
            lock.unlock()
        }
    }
    
    
    class Developer {
        
        var name: String
        var leftSpoon: Spoon
        var rightSpoon: Spoon
        var hasLeft: Bool
        var hasRight: Bool
        var runScenario: Bool = true
        let lock = NSLock()
        
        init(name: String, leftSpoon: Spoon, rightSpoon: Spoon, hasLeft: Bool = false, hasRight: Bool = true) {
            self.name = name
            self.leftSpoon = leftSpoon
            self.rightSpoon = rightSpoon
            self.hasLeft = hasLeft
            self.hasRight = hasRight
        }
        
        func think() {
            print("\(name) is thinking")
            
            if leftSpoon.index > rightSpoon.index {
                
                self.leftSpoon.pickUp()
                print("\(name) picked up his left spoon")
                self.rightSpoon.pickUp()
                print("\(name) picked up his right spoon")
                
            } else {
                self.rightSpoon.pickUp()
                print("\(name) picked up his right spoon")
                self.leftSpoon.pickUp()
                print("\(name) picked up his left spoon")
            }
        }
        
        func eat() {
            print("\(name) is eating")
            usleep(100)
            leftSpoon.putDown()
            hasLeft = false
            print("\(name) put down his left spoon")
            rightSpoon.putDown()
            hasRight = false
            print("\(name) put down his right spoon")
        }
        
        func run() {
            print("running")
            if runScenario {
                while runScenario {
                    think()
                    eat()
                }
            }
        }
    }
}
