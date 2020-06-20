class Program {
    // O(n) time | O(1) space - where n is the length of the input array
    func longestPeak(array: [Int]) -> Int {
        var longestPeakLength = 0
        var i = 1
        while i < array.count - 1 {
            let isPeak = array[i - 1] < array[i] && array[i] > array[i + 1]
            if !isPeak {
                i += 1
                continue
            }

            var leftIdx = i - 2
            while leftIdx >= 0, array[leftIdx] < array[leftIdx + 1] {
                leftIdx -= 1
            }

            var rightIdx = i + 2
            while rightIdx < array.count, array[rightIdx] < array[rightIdx - 1] {
                rightIdx += 1
            }

            let currentPeakLength = rightIdx - leftIdx - 1
            if currentPeakLength > longestPeakLength {
                longestPeakLength = currentPeakLength
            }
            i = rightIdx
        }
        return longestPeakLength
    }
}
