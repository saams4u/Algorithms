class Program {
    // O(n) time | O(n) space
    func balancedBrackets(string: String) -> Bool {
        let openingBrackets = "([{"
        let closingBrackets = ")]}"
        let matchingBrackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]

        var stack = [Character]()

        for character in string {
            if openingBrackets.contains(character) {
                stack.append(character)
            } else if closingBrackets.contains(character) {
                if stack.count == 0 {
                    return false
                } else {
                    if let lastCharacter = stack.last, lastCharacter == matchingBrackets[character] {
                        stack.popLast()
                    } else {
                        return false
                    }
                }
            }
        }

        return stack.count == 0
    }
}
