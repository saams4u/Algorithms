#include <algorithm>
#include <climits>
#include <vector>

using namespace std;

// O(nlog(n) + mlog(m)) time | O(1) space
vector<int> smallestDifference(vector<int> arrayOne, vector<int> arrayTwo) {
  sort(arrayOne.begin(), arrayOne.end());
  sort(arrayTwo.begin(), arrayTwo.end());
  int idxOne = 0;
  int idxTwo = 0;
  int smallest = INT_MAX;
  int current = INT_MAX;
  vector<int> smallestPair;
  while (idxOne < arrayOne.size() && idxTwo < arrayTwo.size()) {
    int firstNum = arrayOne[idxOne];
    int secondNum = arrayTwo[idxTwo];
    if (firstNum < secondNum) {
      current = secondNum - firstNum;
      idxOne++;
    } else if (secondNum< firstNum) {
      current = firstNum -secondNum;
      idxTwo++;
    } else {
      return vector<int>{firstNum, secondNum};
    }
    if (smallest > current) {
      smallest = current;
      smallestPair = {firstNum, secondNum};
    }
  }
  return smallestPair;
}