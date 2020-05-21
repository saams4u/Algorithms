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

    // O(n) time | O(d) space
    func validateBST(tree: BST) -> Bool {
        var minimum = Int(Int32.min)
        var maximum = Int(Int32.max)
        return validateBSTHelper(tree: tree, minimum: &minimum, maximum: &maximum)
    }

    func validateBSTHelper(tree: BST?, minimum: inout Int, maximum: inout Int) -> Bool {
        if tree === nil {
            return true
        }

        if let tree = tree, let value = tree.value, value < minimum || value >= maximum {
            return false
        }

        if var treeValue = tree?.value {
            let leftIsValid = validateBSTHelper(tree: tree?.left, minimum: &minimum, maximum: &treeValue)
            let rightIsValid = validateBSTHelper(tree: tree?.right, minimum: &treeValue, maximum: &maximum)

            return leftIsValid && rightIsValid
        } else {
            return false
        }
    }

}