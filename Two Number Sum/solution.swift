class Program {
    // O(nlog(n)) time | O(1) space
    func twoNumberSum(array: [Int], targetSum: Int) -> [Int] {
        let array = array.sorted()

        var leftPointer = 0
        var rightPointer = array.count - 1

        while leftPointer < rightPointer {
            let leftMost = array[leftPointer]
            let rightMost = array[rightPointer]

            let currentSum = leftMost + rightMost

            if currentSum == targetSum {
                return [leftMost, rightMost]
            } else if currentSum < targetSum {
                leftPointer = leftPointer + 1
            } else if currentSum > targetSum {
                rightPointer = rightPointer - 1
            }
        }

        return []
    } 
}