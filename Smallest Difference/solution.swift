class Program {
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        arrayOne.sort()
        arrayTwo.sort()

        var idxOne = 0
        var idxTwo = 0

        var current = Int.max
        var smallest = Int.max

        var smallestPair: [Int] = []

        while idxOne < arrayOne.count, idxTwo < arrayTwo.count {
            let firstNum = arrayOne[idxOne] 
            let secondNum = arrayTwo[idxTwo]

            if firstNum < secondNum {
                current = secondNum - firstNum
                idxOne = idxOne + 1
            } else if firstNum > secondNum {
                current = firstNum - secondNum
                idxTwo = idxTwo + 1
            } else {
                return [firstNum, secondNum]
            }

            if smallest > current {
                smallest = current
                smallestPair = [firstNum, secondNum]
            }
        }

        return smallestPair
    }
}