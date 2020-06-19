class Program {
    // O(n) time | O(1) space - where n is the length of the array
    func isMonotonic(array: [Int]) -> Bool {
        if array.count <= 2 {
            return true
        }

        var isNonDecreasing = true
        var isNonIncreasing = true

        for i in 1 ..< array.count {
            if array[i] < array[i - 1] {
                isNonDecreasing = false
            }
            if array[i] > array[i - 1] {
                isNonIncreasing = false
            }
        }

        return isNonDecreasing || isNonIncreasing
    }
}
