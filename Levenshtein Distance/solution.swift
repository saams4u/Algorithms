class Program {
    // O(nd) time | O(min(n, m) space)
    func levenshteinDistance(firstString: String, secondString: String) -> Int {
        let small = firstString.count < secondString.count ? firstString : secondString
        let big = firstString.count >= secondString.count ? firstString : secondString

        var evenEdits = [Int]()
        var oddEdits = Array(repeating: 0, count: small.count + 1)

        for i in 0 ..< small.count + 1 {
            evenEdits.append(i)
        }

        for i in 1 ..< big.count + 1 {
            if i % 2 == 1 {
                optimizedLevenshteinHelper(bigIndex: i, smallString: small, bigString: big, currentEdits: &oddEdits, previousEdits: &evenEdits)
            } else {
                optimizedLevenshteinHelper(bigIndex: i, smallString: small, bigString: big, currentEdits: &evenEdits, previousEdits: &oddEdits)
            }
        }

        return big.count % 2 == 0 ? evenEdits[small.count] : oddEdits[small.count]
    }

    func optimizedLevenshteinHelper(bigIndex: Int, smallString: String, bigString: String, currentEdits: inout [Int], previousEdits: inout [Int]) {
        currentEdits[0] = bigIndex

        for j in 1 ..< smallString.count + 1 {
            let firstIndex = bigString.index(bigString.startIndex, offsetBy: bigIndex - 1)
            let secondIndex = smallString.index(smallString.startIndex, offsetBy: j - 1)

            if bigString[firstIndex] == smallString[secondIndex] {
                currentEdits[j] = previousEdits[j - 1]
            } else {
                currentEdits[j] = 1 + min(previousEdits[j], min(previousEdits[j - 1], currentEdits[j - 1]))
            }
        }
    }

}