class Program {
    // O(nd) time | O(n) space
    func numberOfWaysToMakeChange(target: Int, denominations: [Int]) -> Int {
        var ways = Array(repeating: 0, count: target + 1)
        ways[0] = 1

        for denomination in denominations {
            for amount in 1 ..< target + 1 {
                if denomination <= amount {
                    ways[amount] = ways[amount] + ways[amount - denomination]
                }
            }
        }

        return ways[target]
    }
}