import Foundation

func sumNumbers(numbers : Int...) -> Int {
    return numbers.reduce(0, {x, y in x + y})
}

print(sumNumbers(numbers: 1, 2, 3, 4))



