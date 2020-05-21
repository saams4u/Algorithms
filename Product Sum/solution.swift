class Program {
    // O(n) time | O(d) space
    func productSum(_ array: [Any], multiplier: Int) -> Int {
        var sum = 0

        for element in array {
            if let elementAsArray = element as? [Any] {
                sum += productSum(elementAsArray, multiplier: multiplier + 1)
            } else if let elementAsInt = element as? Int {
                sum += elementAsInt
            }
        }

        return sum * multiplier
    }
}