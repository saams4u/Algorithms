class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }

    // Average: O(log(n)) time | O(1) space
    // Worst: O(n) time | O(1) space
    func findClosestValueInBST(tree: BST?, target: Int) -> Int {
        var closest = Int(Int32.max)

        return findClosestValueInBSTHelper(tree: tree, target: target, closest: &closest)
    }

    func findClosestValueInBSTHelper(tree: BST?, target: Int, closest: inout Int) -> Int {
        var currentNode = tree

        while currentNode !== nil {
            if let node = currentNode {
                let closestDifference = target - closest
                let currentDifference = target - node.value

                if closestDifference.magnitude > currentDifference.magnitude {
                    closest = node.value
                }
            }

            if let node = currentNode, target < node.value {
                currentNode = node.left
            } else if let node = currentNode, target > node.value {
                currentNode = node.right
            } else {
                break
            }
        }

        return closest
    }
}