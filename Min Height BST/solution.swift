class Program {
    // O(n) time | O(n) space - where n is the length of the array
    static func minHeightBST(_ array: [Int]) -> BST? {
        return constructMinHeightBst(array, 0, array.count - 1)
    }

    static func constructMinHeightBst(_ array: [Int], _ startIdx: Int, _ endIdx: Int) -> BST? {
        if endIdx < startIdx {
            return nil
        }

        var midIdx = (startIdx + endIdx) / 2
        var bst = BST(value: array[midIdx])
        bst.left = constructMinHeightBst(array, startIdx, midIdx - 1)
        bst.right = constructMinHeightBst(array, midIdx + 1, endIdx)
        return bst
    }

    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
        }

        func insert(value: Int) {
            if value < self.value {
                if let  left = self.left {
                    left.insert(value: value)
                } else {
                    left = BST(value: value)
                }
            } else {
                if let right = self.right {
                    right.insert(value: value)
                } else {
                    right = BST(value: value)
                }
            }
        }
    }
} 
    





