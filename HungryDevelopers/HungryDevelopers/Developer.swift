//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Developer {
    
    // MARK: - Properties
    
    let id: Int
    var spoonsInPossession: [Spoon] = []
    
    // MARK: - Init
    
    init(id: Int) {
        self.id = id
    }
    
    // MARK: - Public
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    func requestSpoon(for developer: Developer) {
        print("Developer #\(developer.id) requested a spoon from developer #\(id) \n")
        
        var spoons: [Spoon] = []
        
        personalQueue.sync {
            spoons = self.spoonsInPossession
        }
        
        let dirtySpoons = spoons.filter { $0.isDirty }
        if !dirtySpoons.isEmpty && spoons.count != 2 {
            send(spoon: dirtySpoons.last!, to: developer)
        } else {
            waitingList.append(developer)
        }
    }
    
    func receive(spoon: Spoon) {
        personalQueue.sync {
            spoonsInPossession.append(spoon)
            self.waitingOnSpoonGroup.leave()
            print("Developer #\(id) received spoon #\(spoon.id)")
        }
    }
    
    // MARK: - Private Properties
    
    private var waitingList: [Developer] = []
    private lazy var personalQueue = DispatchQueue(label: "Developer #\(id)'s Personal Queue")
    private let waitingOnSpoonGroup = DispatchGroup()
    
    private var devOnLeft: Developer {
        let leftID = ((self.id - 1) % developers.count + developers.count) % developers.count
        return developers[leftID]
    }
    
    private var devOnRight: Developer {
        let rightId = (self.id + 1) % developers.count
        return developers[rightId]
    }
    
    private func think() {
        print("Developer #\(id) is now thinking \n")
        
        
        var cleanSpoons: [Spoon] = []
        
        // Read in spoons on personal queue
        personalQueue.sync {
            cleanSpoons = spoonsInPossession
        }
        
        let spoonsNeeded = 2 - cleanSpoons.count
        
        if spoonsNeeded > 0 {
            waitingOnSpoonGroup.enter()
            interactionQueue.async {
                self.devOnLeft.requestSpoon(for: self)
                //self.devOnRight.requestSpoon(for: self)
            }
        }
        
        if spoonsNeeded > 1 {
            waitingOnSpoonGroup.enter()
            interactionQueue.async {
                //.devOnLeft.requestSpoon(for: self)
                self.devOnRight.requestSpoon(for: self)
            }
        }
        
        waitingOnSpoonGroup.wait() // Wait here for a spoon
        
        personalQueue.sync {
            cleanSpoons = spoonsInPossession
            if cleanSpoons.count == 2 {
                for spoon in cleanSpoons {
                    spoon.pickUp()
                    print("Developer #\(id) picked up spoon #\(spoon.id)")
                }
                print("\n")
            }
        }
    }
    
    private func eat() {
        print("Developer #\(id) is now eating \n")
        usleep(UInt32.random(in: 100_000...1_000_000))
        
        personalQueue.sync {
            spoonsInPossession.forEach { $0.putDown() }
            let dirtySpoons = spoonsInPossession.filter { $0.isDirty }
            for spoon in dirtySpoons {
                if !waitingList.isEmpty {
                    let developer = waitingList.removeFirst()
                    interactionQueue.async {
                        self.send(spoon: spoon, to: developer)
                    }
                }
            }
        }
    }
    
    private func send(spoon: Spoon, to developer: Developer) {
        personalQueue.sync {
            guard let index = self.spoonsInPossession.firstIndex(of: spoon) else { return }
            self.spoonsInPossession.remove(at: index)
            spoon.isDirty = false
        }
        
        developer.receive(spoon: spoon)
        print("Developer #\(id) sent spoon #\(spoon.id) to developer #\(developer.id)")
    }
}
