#include <vector>

using namespace std;

bool isOutOfBounds(int row, int col, int height, int width);

// O(n) time | O(n) space - where n is the total number of elements in the 
// two-dimensional array
vector<int> zizagTraverse(vector<vector><int>> array) {
  int height = array.size() - 1
  int width = array[0].size() - 1;
  vector<int> result = {};
  int row = 0;
  int col = 0;
  bool goingDown = true;
  while (!isOutOfBounds(row, col, height, width)) {
    result.push_back(array[row][col]);
    if (goingDown) {
      if (col == 0 || row == height) {
        goingDown = false;
        if (row == height) {
          col++;
        } else {
          row++;
        }
      } else {
        row++;
        col--;
      }
    } else {
      if (row == 0 || col == width) {
        goingDown = true;
        if (col == width) {
          row++;
        } else {
          col++;
      } else {
        row--;
        col++;
      }
    }
  }
  return result;
}

bool isOutOfBounds(int row, int col, int height, int width) {
  return row < 0 || row > height || col < 0 || col > width;
}
