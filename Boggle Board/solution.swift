class Program {
    // O(nm*8^s + ws) time | O(nm + ws) space
    func boggleBoard(boggleBoard: [[String]], words: [String]) -> [String] {
        let trie = Trie()

        for word in words {
            trie.add(word)
        }

        var finalWords = [String: Bool]()
        var visited = boggleBoard.map { row in row.map { _ in false } }

        for i in 0 ..< boggleBoard.count {
            for j in 0 ..< boggleBoard[i].count {
                explore(i, j, boggleBoard, trie.root, &visited, &finalWords)
            }
        }

        let keys = Array(finalWords.keys)
        return keys
    }

    func explore(_ i: Int, _ j: Int, _ board: [[String]], _ trieNode: TrieNode, _ visited: inout [[Bool]], _ finalWords: inout [String: Bool]) {
        if visited[i][j] {
            return
        }

        let letter = board[i][j]

        if !trieNode.children.keys.contains(letter) {
            return
        }

        visited[i][j] = true

        let nextNode = trieNode.children[letter] as! TrieNode

        if nextNode.children.keys.contains("*") {
            if let word = nextNode.children["*"] as? String {
                finalWords[word] = true
            }
        }

        let neighbors = getNeighbors(i, j, board: board)

        for neighbor in neighbors {
            explore(neighbor[0], neighbor[1], board, nextNode, &visited, &finalWords)
        }

        visited[i][j] = false
    }

    func getNeighbors(_ i: Int, _ j: Int, board: [[String]]) -> [[Int]] {
        var neighbors = [[Int]]()

        if i > 0, j > 0 {
            neighbors.append([i - 1, j - 1])
        }

        if i > 0 {
            neighbors.append([i - 1, j])
        }

        if i > 0, j < board[i].count - 1 {
            neighbors.append([i - 1, j + 1])
        }

        if j < board[i].count - 1 {
            neighbors.append([i, j + 1])
        }

        if i < board.count - 1, j < board[i].count - 1{
            neighbors.append([i + 1, j + 1])
        }

        if i < board.count - 1 {
            neighbors.append([i + 1, j])
        }

        if i < board.count - 1, j > 0 {
            neighbors.append([i + 1, j - 1])
        }

        if j > 0 {
            neighbors.append([i, j - 1])
        }

        return neighbors
    }

    class TrieNode {
        var children: [String: Any] = [:]
    }

    class Trie {
        var root: TrieNode
        let endSymbol: String = "*"

        init() {
            root = TrieNode()
        }

        func add(_ word: String) {
            var current = root

            for character in word {
                let stringifiedCharacter = String(character)

                if !current.children.keys.contains(stringifiedCharacter) {
                    current.children[stringifiedCharacter] = TrieNode()
                }

                let nextNode = current.children[stringifiedCharacter] as! TrieNode
                current = nextNode
            }

            current.children[endSymbol] = word
        }
    }
}













