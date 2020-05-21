class Program {
    class MinHeap {
        var heap = [Int]()

        init(array: [Int]) {
            heap = array
            buildHeap(array: array)
        }

        // O(n) time | O(1) space
        func buildHeap(array: [Int]) {
            var firstParentIndex = Double((array.count - 2) / 2)
            firstParentIndex = firstParentIndex.rounded(.down)

            for var currentIndex in (0 ... Int(firstParentIndex)).reversed() {
                var endIndex = array.count - 1
                siftDown(currentIndex: currentIndex, endIndex: endIndex)
            }
        }

        // O(log(n)) time | O(1) space
        func siftDown(currentIndex: Int, endIndex: Int) {
            var childOneIdx = currentIndex * 2 + 1
            var current = currentIndex
            while childOneIdx <= endIndex {
                var childTwoIdx = -1
                if current*2+2 <= endIndex {
                    childTwoIdx = current*2 + 2
                }
                var indexToSwap = childOneIdx
                if childTwoIdx > -1 && heap[childTwoIdx] < heap[childOneIdx] {
                    indexToSwap = childTwoIdx
                }
                if heap[indexToSwap] < heap[current] {
                    swap(firstIndex: current, secondIndex: indexToSwap)
                    current = indexToSwap
                    childOneIdx = current * 2 + 1
                } else {
                    return
                }
            }
        }

        // O(log(n)) time | O(1) space
        func siftUp() {
            var currentIndex = heap.count - 1
            var parentIndex = (currentIndex- 1) / 2

            while currentIndex > 0 {
                var current = heap[currentIndex]
                var parent = heap[Int(parentIndex)]
                if current < parent {
                    swap(firstIndex: currentIndex, secondIndex: parentIndex)
                    currentIndex = parentIndex
                    parentIndex = (currentIndex - 1) / 2
                } else {
                    return
                }
            }
        }

        // O(1) time | O(1) space
        func peek() -> Int {
            return heap[0]
        }

        // O(log(n)) time | O(1) space
        func remove() -> Int {
            var l = heap.count
            swap(firstIndex: 0, secondIndex: l-1)
            var peeked = heal[l-1]
            heap.removeLast()
            siftDown(currentIndex: 0, endIndex: l-2)
            return peeked
        }

        // O(log(n)) time | O(1) space
        func insert(value: Int) {
            heap.append(value)
            siftUp()
        }

        // Generic swap function
        func swap(firstIndex: Int, secondIndex: Int) {
            let temp = heap[firstIndex]
            heap[firstIndex] = heap[secondIndex]
            heap[secondIndex] = temp
        }

        func length() -> Int {
            return heap.count
        }
    }
}