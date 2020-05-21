class Program {
    // O(n) time | O(1) space
    func findThreeLargestNumbers(array: [Int] -> [Int]) {
        var threeLargest: [Int?] = [nil, nil, nil]

        for number in array {
            updateLargest(&threeLargest, number)
        }

        let threeLargestWithoutOptionals = threeLargest.compactMap { $0 }
        return threeLargestWithoutOptionals
    }

    func updateLargest(_ threeLargest: inout [Int?], _ number: Int) {
        if threeLargest[2] == nil {
            shiftAndUpdate(&threeLargest, number, 2)
        } else if threeLargest[1] == nil {
            shiftAndUpdate(&threeLargest, number, 1)
        } else if threeLargest[0] == nil {
            shiftAndUpdate(&threeLargest, number, 0)
        }

        if let thirdNumber = threeLargest[2], number > thirdNumber {
            shiftAndUpdate(&threeLargest, number, 2)
        } else if let secondNumber = threeLargest[1], number > secondNumber {
            shiftAndUpdate(&threeLargest, number, 1)
        } else if let firstNumber = threeLargest[0], number > firstNumber {
            shiftAndUpdate(&threeLargest, number, 0)
        }
    }

    func shiftAndUpdate(_ threeLargest: inout [Int?], _ number: Int, _ index: Int) {
        for i in 0 ... index {
            if i == index {
                threeLargest[i] = number
            } else {
                threeLargest[i] = threeLargest[i + 1]
            }
        }
    }
}