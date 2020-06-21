class Program {
    // O(n + m) time | O(1) space
    func searchInSortedMatrix(matrix: [[Int]], target: Int) -> [Int] {
        var row = 0
        var column = matrix[0].count - 1

        while row < matrix.count, column >= 0 {
            if matrix[row][column] > target {
                column = column - 1
            } else if matrix[row][column] < target {
              row = row + 1
            } else {
              return [row, column]
            }
        }

        return [-1, -1]
    }
}
