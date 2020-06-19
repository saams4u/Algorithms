class Program {
    // O(n) time | O(n) space - where n is the total number of elements in the array
    func spiralTraverse(array: [[Int]]) -> [Int] {
        var result = [Int]()
        spiralFill(array, 0, array.count - 1, 0, array[0].count - 1, &result)
        return result
    }

    func spiralFill(_ array: [[Int]], _ startRow: Int, _ endRow: Int, _ startCol: Int, _ endCol: Int, _result: inout [Int]) {
        if startRow > endRow || startCol > endCol {
            return
        }

        for col in stride(from: startCol, through: endCol, by: 1) {
            result.append(array[startRow][col])
        }

        for row in stride(from: startRow + 1, through: endRow, by: 1) {
            result.append(array[row][endCol])
        }

        for col in stride(from: endCol - 1, through: startCol, by: -1) {
            if startRow == endRow {
                break
            }
            result.append(array[endRow][col])
        }

        for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
            if startCol == endCol {
                break
            }
            result.append(array[row][startCol])
        }

        spiralFill(array, startRow + 1, endRow - 1, startCol + 1, endCol - 1, &result)

    }
}





