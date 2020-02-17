//
//  ViewController.swift
//  HungryDevelopersAP
//
//  Created by Jorge Alvarez on 2/13/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import UIKit

/*

 Each developer is hungry, and trying to solve a difficult programming challenge. They alternately think and eat soup. However, a developer can only eat soup when they have both the spoon to their left and the spoon to their right.

 After a developer finishes eating, they must put down both spoons, so that other developers can use them. A developer can take the spoon on their left or their right as soon as they're available, but they cannot start eating before they get both spoons.

 Assume that there is an unlimited supply of soup for each developer, and that they have infinitely big stomachs. In other words, they can keep eating and thinking forever. One more rule: the developers can't talk to each other. In other words, they can't know when others are waiting to eat or think.

 Your goal is to write a program that simulates this scenario. A correct solution will run forever with each developer getting regular turns at eating. If the program hangs, or fails to allow a particular to developer to ever get some soup, that's not a working solution.
 
 Create a class called Spoon. It should have two methods, pickUp() and putDown().
 If pickUp() is called while the spoon is in use by another developer, pickUp() should wait until the other developer calls putDown(). You can implement this with a private lock property.
 Create a class called Developer. Each Developer should have a leftSpoon property and a rightSpoon property. It should also have think(), eat(), and run() methods.
 Developer.run() should call think() then eat() over and over again forever.
 think() should pick up both spoons before returning.
 eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
 Create 5 Spoons and 5 Developers giving each developer a left and right spoon. Note that developers will of course share spoons. Every developer's right spoon is the next developer's left spoon.
 Call run() on each developer in a different queue/thread. You can do this with the following code assuming you put your developers in an array:

 DispatchQueue.concurrentPerform(iterations: 5) {
 developers[$0].run()
 }
 
 To recap the algorithm you're writing here, each developer will:

 think until the left spoon is available; when it is, pick it up;
 think until the right spoon is available; when it is, pick it up;
 when both spoons are held, eat for a fixed amount of time;
 then, put the right spoon down;
 then, put the left spoon down;
 repeat from the beginning.
 
 */

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mac: Developer = Developer()
        mac.name = "Mac"
        let charlie: Developer = Developer()
        charlie.name = "Charlie"
        let dennis: Developer = Developer()
        dennis.name = "Dennis"
        let dee: Developer = Developer()
        dee.name = "Dee"
        let frank: Developer = Developer()
        frank.name = "Frank"
        
        let spoon1 = Spoon()
        spoon1.index = 1
        let spoon2 = Spoon()
        spoon2.index = 2
        let spoon3 = Spoon()
        spoon3.index = 3
        let spoon4 = Spoon()
        spoon4.index = 4
        let spoon5 = Spoon()
        spoon5.index = 5
        
        mac.rightSpoon = spoon1
        charlie.leftSpoon = mac.rightSpoon
        charlie.rightSpoon = spoon2
        dennis.leftSpoon = charlie.rightSpoon
        dennis.rightSpoon = spoon3
        dee.leftSpoon = dennis.rightSpoon
        dee.rightSpoon = spoon4
        frank.leftSpoon = dee.rightSpoon
        frank.rightSpoon = spoon5
        mac.leftSpoon = frank.rightSpoon
        
        let developers: [Developer] = [mac, charlie, dennis, dee, frank]
        
        print("START")
        // Last dev never runs for some reason (only if I take out think/eat from run())
        DispatchQueue.concurrentPerform(iterations: 5) {
            print("called run on index \($0)")
            developers[$0].run()
        }
    }
}

class Spoon {
    private var spoonLock = NSLock()
    var index: Int = 0
    /// Locks
    func pickUp() {
        print("Spoon \(index) Picked Up")
        spoonLock.lock()
    }
    
    /// Unlocks
    func putDown() {
        print("Spoon \(index) Put Down")
        spoonLock.unlock()
    }
}

class Developer {
    var rightSpoon = Spoon()
    var leftSpoon = Spoon()
    var name = ""
    
    /// think() should pick up both spoons before returning.
    func think() {
        print("\(name) is Thinking")
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(name) picked up their left spoon (\(leftSpoon.index))")
            rightSpoon.pickUp()
            print("\(name) picked up their right spoon (\(rightSpoon.index))")
        }
        else {
            rightSpoon.pickUp()
            print("\(name) picked up their right spoon (\(rightSpoon.index))")
            leftSpoon.pickUp()
            print("\(name) picked up their left spoon (\(leftSpoon.index))")
        }
    }
    
    /// eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
    func eat() {
        print("\(name) is Eating")
        usleep(690)
        leftSpoon.putDown()
        rightSpoon.putDown()
    }
    
    /// Developer.run() should call think() then eat() over and over again forever.
    func run() {
        print("\(name) RUN")
        // runs forever
        while true {
            think()
            eat()
        }
    }
}

/*
 Add an index property to Spoon.
 Give each spoon an index from 1 to 5.
 Refactor think() function, so that a developer will always pick up their lower-numbered spoon first. (The order in which they put them down doesn't matter.)
 */
