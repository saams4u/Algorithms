class Program {
    // O(n) time | O(n) space
    func largestRange(array: [Int]) -> [Int] {
        var longestLength = 0
        var bestRange = [Int]()
        var hash = [Int: Bool]()

        for number in array {
            hash[number] = true
        }

        for number in array {
            if let hashAtNumber = hash[number], !hashAtNumber {
                continue
            }

            var currentLength = 1
            var left = number - 1
            var right = number + 1

            while hash.keys.contains(left) {
                hash[left] = false
                currentLength += 1
                left -= 1
            }

            while hash.keys.contains(right) {
                hash[right] = false
                currentLength += 1
                right += 1
            }

            if currentLength > longestLength {
                bestRange = [left + 1, right - 1]
                longestLength = currentLength
            }
        }

        return bestRange
    }
}
