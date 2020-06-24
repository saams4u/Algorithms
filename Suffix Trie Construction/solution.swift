class Program {
    class TrieNode {
        var children: [String: Any] = [:]
    }

    class SuffixTrie {
        var root = TrieNode()
        let endSymbol = "*"

        init(string: String) {
            populateSuffixTrieFrom(string: string)
        }

        // O(n^2) time | O(n^2) space
        func populationSuffixTrieFrom(string: String) {
            for i in 0 ..< string.count {
                insertSubstringStartingAt(index: i, string: string, root: root)
            }
        }

        func insertSubstringStartingAt(index: Int, string: String, root: TrieNode) {
            var node = root

            for j in index ..< string.count {
                let jStringIndex = string.index(string.startIndex, offsetBy: j)
                let jthCharacter = String(string[jStringIndex])

                if !node.children.keys.contains(jthCharacter) {
                    node.children[jthCharacter] = TrieNode()
                }

                let nextNode = node.children[jthCharacter] as! TrieNode
                node = nextNode
            }

            node.children[endSymbol] = true
        }

        // O(m) time | O(1) space
        func contains(string: String) -> Bool {
            var node = root

            for character in string {
                let stringifiedCharacter = String(character)

                if !node.children.keys.contains(stringifiedCharacter) {
                    return false
                }

                let nextNode = node.children[stringifiedCharacter] as! TrieNode
                node = nextNode
            }

            let reachedTheEnd = node.children[endSymbol] != nil
            return reachedTheEnd
        }
    }
}
