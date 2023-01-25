import Foundation

// Lighter
// Can't inherit
// Don't need to initialize
// By value

struct Dog {
    var name : String
    var breed : String
    
    func bark() {
        print("\(self.name) is of breed \(self.breed)")
    }
}

var zoe = Dog(name: "Zoe", breed: "Westie")

var fido = zoe // clone
fido.name = "Fido"

zoe.bark()
fido.bark()
