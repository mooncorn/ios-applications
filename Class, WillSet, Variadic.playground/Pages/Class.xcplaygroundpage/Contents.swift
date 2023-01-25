import UIKit

// Heavier
// Can inherit
// Need to initialize
// By reference

class Dog {
    var name : String
    var breed : String
    
    init(name : String, breed : String = "Westier Terrier") {
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("\(self.name) is of breed \(self.breed)")
    }
}

class WestierTerrier : Dog {
    var color : String = "White"
    
    private var _age : Int = 0
    public var age : Int {
        get {
            return self._age
        }
        set {
            if newValue <= 20 {
                self._age = newValue
            }
        }
    }
    
    init(name : String, age : Int) {
        super.init(name: name, breed: "Westier Terrier")
        self.age = age
    }
    
    override func bark() {
        print("\(self.name) is of breed \(self.breed) and is \(self.age) years old.")
    }
    
    func about() {
        print("whatever")
    }
}
