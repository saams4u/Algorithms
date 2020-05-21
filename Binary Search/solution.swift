class Program {
    // O(log(n)) time | O(1) space
    func binarySearch(array: [Int], target: Int) -> Int {
        var leftPointer = 0
        var rightPointer = array.count - 1
        return binarySearchHelper(array: array, target: target, leftPointer: &leftPointer, rightPointer: &rightPointer)
    }

    func binarySearchHelper(array: [Int], target: Int, leftPointer: inout Int, rightPointer: inout Int) -> Int {
        while leftPointer <= rightPointer {
            let middle = (leftPointer + rightPointer) / 2
            let potentialMatch = array[middle]
            if target == potentialMatch {
                return middle
            } else if target < potentialMatch {
                rightPointer = middle - 1
            } else {
                leftPointer = middle + 1
            }
        }

        return -1
    }
}