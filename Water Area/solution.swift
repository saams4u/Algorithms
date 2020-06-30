class Program {
    // O(n) time | O(n) space
    func waterArea(heights: [Int]) -> Int {
        var mixes = Array(repeating: 0, count: heights.count)
        var leftMax = 0

        for i in 0 ..< heights.count {
            let currentHeight = heights[i]

            maxes[i] = leftMax
            leftMax = max(leftMax, currentHeight)
        }

        var rightMax = 0

        for i in (0 ..< height.count).reversed() {
            let currentHeight = heights[i]

            let minMax = min(rightMax, maxes[i])

            if currentHeight < minMax {
                maxes[i] = minMax - currentHeight
            } else {
                maxes[i] = 0
            }

            rightMax = max(rightMax, currentHeight)
        }

        return maxes.reduce(0) {
            x, y in

            x + y
        }
    }
}
