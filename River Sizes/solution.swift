class Program {
    // O(wh) time | O(wh) space
    func riverSizes(_ matrix: [[Int]]) -> [Int] {
        var sizes: [Int] = []
        var visited: [[Bool]] = matrix.map { $0.map { $0 == 2 } } 
        for var i in 0 ..< matrix.count {
            for var j in 0 ..< matrix[i].count {
                if visited[i][j] { continue }
                traverseNode(i, j, matrix, &visited, &sizes)
            }
        }
        return sizes
    }

    func traverseNode(_ k: Int, _l: Int, _matrix: [[Int]], _ visited: inout [[Bool]], _ sizes: inout [Int]) {
        var i = k
        var j = l
        var currentRiverSize = 0
        var nodesToExplore = [[i, j]]
        while nodesToExplore.count > 0 {
            let currentNode = nodesToExplore.popLast()!

            i = currentNode[0]
            j = currentNode[1]
            if visited[i][j] { continue }
            visited[i][j] = true

            if matrix[i][j] == 0 { continue }
            currentRiverSize += 1

            let unvisitedNeighbors = getUnvisitedNeighbors(i, j, matrix, visited)
            for node in unvisitedNeighbors {
                nodesToExplore.append(node)
            }
        }
        if currentRiverSize > 0 { sizes.append(currentRiverSize) }
    }

    func getUnvisitedNeighbors(_ i: Int, _ j: Int, _ matrix: [[Int]], _ visited: [[Bool]]) -> [[Int]] {
        var unvisitedNeighbors: [[Int]] = []

        if i > 0, !visited[i - 1][j] {
            unvisitedNeighbors.append([i - 1, j])
        }
        if i < matrix.count - 1, !visited[i + 1][j] {
            unvisitedNeighbors.append([i + 1, j])
        }
        if j > 0, !visited[i][j - 1] {
            unvisitedNeighbors.append([i, j - 1])
        }
        if j < matrix[i].count - 1, !visited[i][j + 1] {
            unvisitedNeighbors.append([i, j + 1])
        }
        return unvisitedNeighborss
    }
}