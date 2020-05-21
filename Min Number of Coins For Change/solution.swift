class Program {
    // O(nd) time | O(n) space
    func minimumNumberOfCoinsForChange(target: Int, denominations: [Int]) -> Int {
        var numberOfCoins = Array(repeating: Int(Int16.max), count: target + 1)
        numberOfCoins[0] = 0

        for denomination in denominations {
            for amount in 0 ..< numberOfCoins.count {
                if denomination <= amount {
                    numberOfCoins[amount] = min(numberOfCoins[amount], 1 + numberOfCoins[amount - denomination])
                }
            }
        }

        return numberOfCoins[target] != Int(Int16.max) ? numberOfCoins[target] : -1
    }
}