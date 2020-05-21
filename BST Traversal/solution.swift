class Program {
    class BST {
        var value: Int?
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }

    // O(n) time | O(n) space
    func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        if tree !== nil {
            inOrderTraversal(tree: tree?.left, array: &array)

            if let value = tree?.value {
                array.append(value)
            }

            inOrderTraversal(tree: tree?.right, array: &array)
        }

        return array
    }

    // O(n) time | O(n) space
    func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        if tree !== nil {
            if let value = tree?.value {
                array.append(value)
            }

            preOrderTraversal(tree: tree?.left, array: &array)
            preOrderTraversal(tree: tree?.right, array: &array)
        }

        return array
    }

    // O(n) time | O(n) space
    func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        if tree !== nil {
            postOrderTraversal(tree: tree?.left, array: &array)
            postOrderTraversal(tree: tree?.right, array: &array)

            if let value = tree?.value {
                array.append(value)
            }
        }

        return array
    }
}