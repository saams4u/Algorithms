#include <vector>

using namespace std;

class BinaryTree {
public:
  int value;
  BinaryTree *left;
  BinaryTree *right;

  BinaryTree(int value) {
    this->value = value;
    left = NULL;
    right = NULL;
  }
};

void calculateBranchSums(BinaryTree *node, int runningSum, vector<int> &sums);

// O(n) time | O(n) space - where n is the number of nodes in the Binary Tree
vector<int> branchSums(BinaryTree *root) {
    vector<int> sums;
    calculateBranchSums(root, 0, sums);
    return sums;
}

void calculateBranchSums(BinaryTree *node, int runningSum, vector<int> &sums) {
    if (node == NULL) 
      return;

    int newRunningSum = runningSum + node->value;
    if (node->left == NULL && node->right == NULL) {
        sums.push_back(newRunningSum);
        return;
    }

    calculateBranchSums(node->left, newRunningSum, sums);
    calculateBranchSums(node->right, newRunningSum, sums);
}
