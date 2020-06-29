class Program {
    // O(n) time | O(1) space
    func minNumberOfJumps(array: [Int]) -> Int {
        if array.count == 1 {
            return 0
        }

        var jumps = 0
        var steps = array[0]
        var maximumReach = array[0]

        for i in 1 ..< array.count - 1 {
            maximumReach = max(maximumReach, array[i] + i)
            steps -= 1

            if steps == 0 {
                jumps += 1
                steps = maximumReach - i
            }
        }

        return jumps + 1
    }
}
