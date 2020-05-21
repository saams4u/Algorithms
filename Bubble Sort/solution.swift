class Program {
    // Best: O(n) time | O(1) space
    // Average: O(n^2) time | O(1) space
    // Worst: O(n^2) time | O(1) space
    func bubbleSort(array: inout [Int]) -> [Int] {
        var isSorted = false
        var counter = 0

        while !isSorted {
            isSorted = true
            for i in 0 ..< array.count - 1 - counter {
                if array[i] > array[i + 1] {
                    swapHelper(i, i + 1, &array)
                    isSorted = false
                }
            }

            counter = counter + 1
        }
        return array
    }

    func swapHelper(_ firstIndex: Int, _ secondIndex:Int, _ array: inout [Int]) {
        let temp = array[secondIndex]
        array[secondIndex] = array[firstIndex]
        array[firstIndex] = temp
    }
}