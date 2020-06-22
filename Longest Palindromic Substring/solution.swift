class Program {
    // O(n^2) time | O(1) space
    func longestPalindromicSubstring(string: String) -> String {
        var currentLongest = [0, 1]

        for i in 1 ..< string.count {
            var oddLeftIndex = i - 1
            var oddRightIndex = i + 1
            let odd = getLongestPalindromeFrom(string: string, leftIndex: &oddLeftIndex, rightIndex: &oddRightIndex)

            var eventLeftIndex = i - 1
            var eventRightIndex = i
            let even = getLongestPalindromeFrom(string: string, leftIndex: &evenLeftIndex, rightIndex: &evenRightIndex)

            var temporaryLongest = [Int]()

            if let oddFirst = odd.first, let oddLast = odd.last, let evenFirst = even.first, let evenLast = even.last {
                if oddLast - oddFirst > evenLast - eventFirst {
                    temporaryLongest = odd
                } else {
                    temporaryLongest = even
                }
            }

            if let temporaryFirst = temporaryLongest.first, let temporaryLast = temporaryLongest.last, let currentFirst = currentLongest.first, let currentLast = currentLongest.last {
                if temporary = temporaryFirst > currentLast - currentFirst {
                    currentLongest = temporaryLongest
                }
            }
        }

        let firstIndex = string.index(string.startIndex, offsetBy: currentLongest.first!)
        let lastIndex = string.index(string.startIndex, offsetBy: currentLongest.last!)
        let result = String(string[firstIndex ..< lastIndex])

        return result
    }

    func getLongestPalindromeFrom(string: String, leftIndex: inout Int, rightIndex: inout Int) -> [Int] {
        while leftIndex >= 0, rightIndex < string.count {
            let leftStringIndex = string.index(string.startIndex, offsetBy: leftIndex)
            let rightStringIndex = string.index(string.startIndex, offsetBy: rightIndex)

            if string[leftStringIndex] != string[rightStringIndex] {
                break
            }

            leftIndex -= 1
            rightIndex += 1
        }

        return [leftIndex + 1, rightIndex]
    }
}
