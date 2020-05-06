import Cocoa

class Spoon {
    static func pickUp() {
        print("Picked up spoon")
    }
    
    static func putDown() {
        print("Put down spoon")
    }
}

class Developer {
    let leftSpoon = ""
    let rightSpoon = ""
    
    static func eat() {
        print("eating")
    }
    
    static func think() {
        print("thinking")
    }
    
    static func run() {
        print("running")
    }
    
}
