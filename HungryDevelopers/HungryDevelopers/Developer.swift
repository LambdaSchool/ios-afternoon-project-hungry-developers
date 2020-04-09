//
//  Developer.swift
//  HungryDevelopers
//
//  Created by Shawn Gee on 4/9/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

class Request {
    
    init(developer: Developer) {
        self.developer = developer
    }
    
    let developer: Developer
    var fulfilled = false
}

class Developer {
    
    // MARK: - Public Properties
    
    let id: Int
    var spoonsInPossession: [Spoon] = []
    
    // MARK: - Init
    
    init(id: Int) {
        self.id = id
    }
    
    // MARK: - Public Methods
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
    func process(request: Request) {
        print("Developer #\(request.developer.id) requested a spoon from developer #\(id) \n")
        
        var spoons: [Spoon] = []
        
        personalQueue.sync {
            spoons = self.spoonsInPossession
        }
        
        let dirtySpoons = spoons.filter { $0.isDirty }
        if !dirtySpoons.isEmpty {
            if !request.fulfilled {
                request.fulfilled = true
                send(spoon: dirtySpoons.last!, to: request.developer)
            }
        } else {
            waitingList.append(request)
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
    
    private var waitingList: [Request] = []
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
    
    // MARK: - Private Methods
    
    private func think() {
        print("Developer #\(id) is now thinking \n")
        
        
        var spoons: [Spoon] = []
        
        // Read in spoons on personal queue
        personalQueue.sync {
            spoons = spoonsInPossession
        }
        
        
        while spoons.count < 2 {
            waitingOnSpoonGroup.enter()
            interactionQueue.async {
                let request = Request(developer: self)
                self.devOnLeft.process(request: request)
                self.devOnRight.process(request: request)
            }
            
            waitingOnSpoonGroup.wait() // Wait here for a spoon
            
            personalQueue.sync {
                spoons = spoonsInPossession
                
                if spoons.count == 2 {
                    for spoon in spoons {
                        spoon.pickUp()
                        print("Developer #\(id) picked up spoon #\(spoon.id)")
                    }
                    print("\n")
                    
                    return
                }
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
                    let request = waitingList.removeFirst()
                    interactionQueue.async {
                        if !request.fulfilled {
                            request.fulfilled = true
                            self.send(spoon: spoon, to: request.developer)
                        }
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
