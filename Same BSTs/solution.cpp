#include <vector>

using namespace std;

bool areSameBsts(vector<int> arrayOne, vector<int> arrayTwo, int rootIdxOne,
                 int rootIdxTwo, int minVal, int maxVal);

int getIdxOfFirstSmaller(vector<int> array, int startingIdx, int minVal);
int getIdxOfFirstBigger(vector<int> array, int startingIdx, int maxVal);

// O(n^2) time | O(d) space - where n is the number of nodes in each array, respectively, and d
// is the depth of the BST that they represent
bool sameBsts(vector<int> arrayOne, vector<int> arrayTwo) {
  return areSameBsts(arrayOne, arrayTwo, 0, 0, INT_MIN, INT_MAX);
}

bool areSameBsts(vector<int> arrayOne, vector<int> arrayTwo, int rootIdxOne,
                 int rootIdxTwo, int minVal, int maxVal) {
  if (rootIdxOne == -1 || rootIdxTwo == -1)
    return rootIdxOne == rootIdxTwo;

  if (arrayOne[rootIdxOne] != arrayTwo[rootIdxTwo])
    return false;

  int leftRootIdxOne = getIdxOfFirstSmaller(arrayOne, rootIdxOne, minVal);
  int leftRootIdxTwo = getIdxOfFirstSmaller(arrayTwo, rootIdxTwo, minVal);

  int rightRootIdxOne = getIdxOfFirstBiggerOrEqual(arrayOne, rootIdxOne, maxVal);
  int rightRootIdxTwo = getIdxOfFirstBiggerOrEqual(arrayTwo, rootIdxTwo, maxVal);

  int currentValue = arrayOne[rootIdxOne];

  bool leftAreSame = areSameBsts(arrayOne, arrayTwo, leftRootIdxOne,
                                 leftRootIdxTwo, minVal, currentValue);
  bool rightAreSame = areSameBsts(arrayOne, arrayTwo, rightRootIdxOne,
                                  rightRootIdxTwo, currentValue, maxVal);

  return leftAreSame && rightAreSame;
}

int getIdxOfFirstSmaller(vector<int> array, int startingIdx, int minVal) {
  for (int i = startingIdx + 1; i < array.size(); i++) {
    if (array[i] < array[startingIdx] && array[i] >= minVal)
      return i;
  }
  return -1;
}

int getIdxOfFirstBiggerOrEqual(vector<int> array, int startingIdx, int maxVal) {
  for (int i = startingIdx + 1; i < array.size(); i++) {
    if (array[i] >= array[startingIdx] && array[i] < maxVal)
      return i;
  }
  return -1;
}
