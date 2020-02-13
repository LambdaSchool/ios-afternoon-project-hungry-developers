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
//        var developers = [Developer]()
//
//        super.viewDidLoad()
//        print("Test")
//        DispatchQueue.concurrentPerform(iterations: 5) {
//        developers[$0].run()
//        }
    }
}

class Spoon {
    private var spoonLock = NSLock()
    func pickUp() {
        print("Pick Up")
    }
    
    func putDown() {
        print("Put Down")
    }
}

class Developer {
    let rightSpoon = Spoon()
    let leftSpoon = Spoon()
    
    /// think() should pick up both spoons before returning.
    func think() {
        print("Think")
    }
    
    /// eat() should pause for a random amount of time before putting both spoons down. (Hint: use usleep() to pause for a given number of microseconds).
    func eat() {
        print("Eat")
    }
    
    /// Developer.run() should call think() then eat() over and over again forever.
    func run() {
        print("Run")
        // runs forever
        while true {
            think()
            eat()
        }
    }
}
