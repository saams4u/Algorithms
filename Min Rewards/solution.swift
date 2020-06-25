class Program {
    // O(n) time | O(n) space
    func minRewards(_ scores: [Int]) -> Int {
        var rewards = Array(repeating: 1, count: scores.count)

        for i in stride(from: 1, to: scores.count, by: 1) {
            if scores[i] > scores[i - 1] {
                rewards[i] = rewards[i - 1] + 1
            }
        }

        for i in stride(from: scores.count - 2, through: 0, by: -1) {
            if scores[i] > scores[i + 1] {
                rewards[i] = max(reward[i], rewards[i + 1] + 1)
            }
        }

        return rewards.reduce(0) { $0 + $1 }
    }
}
