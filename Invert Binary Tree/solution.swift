class Program {
    // O(n) time | O(d) space
    func invertBinaryTree(tree: BinaryTree?) {
        if let tree = tree {
            swapLeftAndRight(tree: tree)
            invertBinaryTree(tree: tree.left)
            invertBinaryTree(tree: tree.right)
        }
    }

    func swapLeftAndRight(tree: BinaryTree) {
        let left = tree.left
        tree.left = tree.right
        tree.right = left
    }
}