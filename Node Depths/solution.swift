class Program {
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?

        init(value: Int) {
            self.value = value
        }
    }

    // Average case: when the tree is balanced
    // O(n) time | O(h) space - where n is the number of nodes in
    // the Binary Tree and h is the height of the Binary Tree
    static func nodeDepths(_ root: BinaryTree?, _ depth: Int = 0) -> Int {
        if let tree = root {
            return depth + nodeDepths(tree.left, depth + 1) + nodeDepths(tree.right, depth + 1)
        }
        return 0
    }
}
