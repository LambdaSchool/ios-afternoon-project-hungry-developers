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
  
    
    static func run() {
        print("running")
        
          func eat() {
              print("eating")
          }
          
          func think() {
              print("thinking")
          }
    }
    
}
Developer.run()
