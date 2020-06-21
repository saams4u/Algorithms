class Program {
    class MinMaxStack {
        var minMaxStack = [[String: Int]]()
        var stack = [Int]()

        // O(1) time | O(1) space
        func peek() -> Int? {
            return stack.last
        }

        // O(1) time | O(1) space
        func pop() -> Int? {
            minMaxStack.popLast()

            return stack.popLast()
        }

        // O(1) time | O(1) space
        func push(number: Int) {
            var newMinMax = ["min": number, "max": number]

            if let lastMinMax = minMaxStack.last {
                newMinMax["min"] = min(lastMinMax["min"]!, newMinMax["min"]!)
                newMinMax["max"] = max(lastMinMax["max"]!, newMinMax["max"]!)
            }

            minMaxStack.append(newMinMax)
            stack.append(number)
        }

        // O(1) time | O(1) space
        func getMin() -> Int? {
            return minMaxStack.last?["min"]
        }

        // O(1) time | O(1) space
        func getMax() -> Int? {
            return minMaxStack.last?["max"]
        }
    }
}
