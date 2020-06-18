class Program {
    // O(n) time | O(1) space
    static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
        var seqIdx = 0
        for value in array {
            if seqIdx == sequence.count {
                break
            }
            if value == sequence[seqIdx] {
                seqIdx += 1
            }
        }
        return seqIdx == sequence.count
    }
}
