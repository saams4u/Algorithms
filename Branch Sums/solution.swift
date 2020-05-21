class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
        }
    }

    // O(n) time | O(n) space - where n is the number of nodes in the Binary Tree
    func branchSums(root: BST) -> [Int] {
        var sums = [Int]()
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        return sums
    }

    func calculateBranchSums(node: BST?, runningSum: Int, sums: inout [Int]) {
        if let n = node {
            let newRunningSum = runningSum + n.value
            if n.left == nil, n.right == nil {
                sums.append(newRunningSum)
                return
            }
            calculateBranchSums(node: n.left, runningSum: newRunningSum, sums: &sums)
            calculateBranchSums(node: n.right, runningSum: newRunningSum, sums: &sums)
        }
    }
}