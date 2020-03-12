import UIKit
import PlaygroundSupport
//this gives me the ability to execute indefinitely
PlaygroundPage.current.needsIndefiniteExecution = true
//number of developers at the table
var numDevelopers = 5
//Creating the Spoon Blueprint
class Spoon {
    let index: Int
    let lock = NSLock()
    //to grab the index only
    init(_ index: Int) {
        self.index = index
    }
    //picking up a spoon locks said spoon with that developer. AKA he is the one eating/working on the thread
    func pickUp(developer: Developer) {
        lock.lock()
    }
    //putting down his spoon and unlocking the spoon for others to use.
    func putDown() {
        lock.unlock()
    }
}

//created a dev. who can also have a type of spoon, they have an index so i can iterate over them
class Developer {
    let index: Int
    var firstSpoon: Spoon?
    var secondSpoon: Spoon?
    var thirdSpoon: Spoon?
    var fourthSpoon: Spoon?
    var fifthSpoon: Spoon?
    var operation: BlockOperation!
    
    init(_ index: Int) {
        self.index = index
    }

    var leftSpoonIndex: Int {
        return index
    }

    var rightSpoonIndex: Int {
        return index == 0 ? numDevelopers - 1 : index - 1
    }

    func run() {

        print("Developer \(index) sat down at the table.")

        while (true) {
            firstSpoon = spoons[min(leftSpoonIndex, rightSpoonIndex)]
            secondSpoon = spoons[max(leftSpoonIndex, rightSpoonIndex)]
            
            firstSpoon!.pickUp(developer: self)
            secondSpoon!.pickUp(developer: self)
            
            print("Developer \(index) eating with Spoons \(firstSpoon!.index) and \(secondSpoon!.index)")
            
            //turned on a sleep of 6 so you can humanly read the compiler and watch which Devs pick up and put down spoons.
//            sleep(1)
            
            firstSpoon!.putDown()
            secondSpoon!.putDown()
            print("Developer \(index) put down Spoons \(firstSpoon!.index) and \(secondSpoon!.index)")
        }
    }
}

var spoons = [Spoon]()
var developers = [Developer]()

for i in 0 ..< numDevelopers {
    spoons.append(Spoon(i))
    developers.append(Developer(i))
}

let queue = OperationQueue()
//creating the devs to act out the function if they have spoons, and manage the custom block on my built queue so it can go ahead and run it.
developers.forEach { developer in
    developer.operation = BlockOperation {
        developer.run()
    }
    queue.addOperation(developer.operation)
}
