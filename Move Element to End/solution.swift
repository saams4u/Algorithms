class Program {
    // O(n) time | O(1) space - where n is the length of the array
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        var i = 0
        var j = array.count - 1
        while i < j {
            while i < j, array[j] == toMove {
                j -= 1
            }
            if array[i] == toMove {
                (array[i], array[j]) = (array[j], array[i])
            }
            i += 1
        }
        return array
    }
}