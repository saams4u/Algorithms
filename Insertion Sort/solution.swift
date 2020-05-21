class Program {
    // Best: O(n) time | O(1) space
    // Average: O(n^2) time | O(1) space
    // Worst: O(n^2) time | O(1) space
    func insertionSort(array: inout [Int]) -> [Int] {
        for i in 1 ..< array.count {
            var j = i

            while j > 0, array[j] < array[j - 1] {
                swapHelper(j, j - 1, &array)
                j = j - 1
            }
        }

        return array
    }

    func swapHelper(_ firstIndex: Int, _ secondIndex: Int, _ array: inout [Int]) {
        let temp = array[secondIndex]

        array[secondIndex] = array[firstIndex]
        array[firstIndex] = temp
    }
}