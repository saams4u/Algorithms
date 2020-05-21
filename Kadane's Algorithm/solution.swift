class Program {
    // O(n) time | O(1) space
    func kadanesAlgorithm(array: [Int]) -> Int {
        if array.count > 0 {
            var maxEndingHere = array.first
            var maxSoFar = array.first

            for i in 1 .. < array.count {
                let currentNumber = array[i]

                maxEndingHere = max(currentNumber, currentNumber + maxEndingHere!)
                maxSoFar = max(maxSoFar!, maxEndingHere!)
            }

            return maxSoFar!
        } else {
            return -1
        }
    }
}