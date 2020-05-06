import UIKit
import PlaygroundSupport

class Spoon {
    
    private var spoonLock = NSLock()
    
    // when spoon should be pickup up
    func pickUp() {
        spoonLock.lock()
        
    }
    
    // we spoon should be put down
    func putDown() {
        
        spoonLock.unlock()
    }
    
}

//Create a class called Developer. Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
//Developer.run() should call think() then eat() over and over again forever.
//think() should pick up both spoons before returning.
//eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
//Create 5 Spoons and 5 Developers giving each developer a left and right spoon. Note that developers will of course share spoons. Every developer's right spoon is the next developer's left spoon.
//Call run() on each developer in a different queue/thread. You can do this with the following code assuming you put your developers in an array:
//DispatchQueue.concurrentPerform(iterations: 5) {
//developers[$0].run()
//}
//To recap the algorithm you're writing here, each developer will:
//
//think until the left spoon is available; when it is, pick it up;
//think until the right spoon is available; when it is, pick it up;
//when both spoons are held, eat for a fixed amount of time;
//then, put the right spoon down;
//then, put the left spoon down;
//repeat from the beginning.
