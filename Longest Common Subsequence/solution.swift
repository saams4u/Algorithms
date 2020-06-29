class Program {
    // O(nm) time | O(nm) space
    func longestCommonSubsequence(firstString: String, secondString: String) -> [String] {
        var lengths = [[Int]]()

        for _ in stride(from: 0, to: firstString.count + 1, by: 1) {
            let row = Array(repeating: 0, count: secondString.count + 1)
            lengths.append(row)
        }

        for i in stride(from: 1, to: firstString.count + 1, by: 1) {
            for j in stride(from: 1, to: secondString.count + 1, by: 1) {
                let firstIndex = firstString.index(firstString.startIndex, offsetBy: i - 1)
                let secondIndex = secondString.index(secondString.startIndex, offsetBy: j - 1)

                if firstString[firstIndex] == secondString[secondIndex] {
                    lengths[i][j] = lengths[i - 1][j - 1] + 1
                } else {
                    lengths[i][j] = max(lengths[i - 1][j], lengths[i][j - 1])
                }
            }
        }

        return buildSequence(lengths: lengths, string: secondString)
    }


    func buildSequence(lengths: [[Int]], string: String) -> [String] {
        var sequence = [String]()

        var i = lengths.count - 1
        var j = lengths[0].count - 1

        while i != 0, j != 0 {
            if lengths[i][j] == lengths[i - 1][j] {
                i -= 1
            } else if lengths[i][j] == lengths[i][j - 1] {
                j -= 1
            } else {
                let index = string.index(string.startIndex, offsetBy: j - 1)
                let char = String(String[index])

                sequence.insert(char, at: 0)
                i -= 1
                j -= 1
            }
        }

        return sequence
    }
}
