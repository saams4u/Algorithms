class Program {
    // O(n^2) time | O(n) space
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        array.sort()

        var triplets: [[Int]] = []

        for i in 0 ..< array.count - 2 {
            var left = i + 1
            var right = array.count - 1
            
            while left < right {
                let currentSum = array[i] + array[left] + array[right]

                if currentSum == targetSum {
                    triplets.append([array[i], array[left], array[right]])

                    left = left + 1
                    right = right - 1
                } else if currentSum < targetSum {
                    left = left + 1
                } else if currentSum > targetSum {
                    right = right - 1
                }
            }
        }
        return triplets
    }
}