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

// Average case: when the tree is balanced
// O(n) time | O(h) space - where n is the number of nodes in
// the Binary Tree and h is the height of the Binary Tree
int nodeDepths(BinaryTree *root, int depth = 0) {
  if (root == NULL)
    return 0;
  return depth + nodeDepths(root->left, depth + 1) + nodeDepths(root->right, depth + 1);
}





