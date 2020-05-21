class Program {
    // O(n) time | O(1) space
    func hasSingleCycle(array: [Int]) -> Bool {
        var currentIndex = 0
        var numberOfElementsVisited = 0

        var innerArray = array
        while numberOfElementsVisited < array.count {
            if currentIndex == 0, numberOfElementsVisited > 0 {
                return false
            }

            numberOfElementsVisited += 1
            currentIndex = getNextIndex(&currentIndex, array: &innerArray)
        }

        return currentIndex == 0
    }

    func getNextIndex(_ currentIndex: inout Int, array: inout [Int]) -> Int {
        let jump = array[currentIndex]
        let nextIndex = (jump + currentIndex) % array.count

        if nextIndex >= 0 {
            return nextIndex
        } else {
            return nextIndex + array.count
        }
    }
}