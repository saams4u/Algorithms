class Program {
    // O(n) time | O(1) space
    func isPalindrome(string: String) -> Bool {
        var leftPointer = 0
        var rightPointer = string.count - 1
        var leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
        var rightIndex = string.index(string.startIndex, offsetBy: rightPointer)

        while leftIndex < rightIndex {
            if string[leftIndex] != string[rightIndex] {
                return false
            }

            leftPointer = leftPointer + 1
            rightPointer = rightPointer - 1
            leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
            rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
        }

        return true
    }
}