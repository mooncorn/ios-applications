import Foundation

var speed : Int = 0 {
    willSet(newValue) {
        print("Your speed was \(speed), now it is \(newValue)")
    }
    didSet(oldValue) {
        print("Your speed is \(speed), it was \(oldValue)")
    }
}

speed = 100
