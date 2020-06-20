class Program {
    // O(n * n!) time | O(n * n!) space
    func permutations(array: inout [Int]) -> [[Int]] {
        var permutations = [[Int]]()
        permutationsHelper(firstIndex: 0, array: &array, permutations: &permutations)

        return permutations
    }

    func permutationsHelper(firstIndex: Int, array: inout [Int], permutations: inout [[Int]]) {
        if firstIndex == array.count - 1 {
            permutations.append(array)
        } else {
            for secondIndex in firstIndex ..< array.count {
                swap(firstIndex: firstIndex, secondIndex: secondIndex, array: &array)
                permutationsHelper(firstIndex: firstIndex + 1, array: &array, permutations: &permutations)
                swap(firstIndex: firstIndex, secondIndex: secondIndex, array: &array)
            }
        }
    }

    func swap(firstIndex: Int, secondIndex: Int, array: inout [Int]) {
        let temp = array[firstIndex]
        array[firstIndex] = array[secondIndex]
        array[secondIndex] = temp
    }
}
