class Program {
    // O(n* 2^n) time | O(2 + 2^n) space
    func powerset(array: [Int]) -> [[Int]] {
        var subsets: [[Int]] = [[]]

        for element in array {
            for subset in subsets {
                subsets.append(subset + [element])
            }
        }
        return subsets
    }
} 
