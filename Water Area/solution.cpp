#include <vector>
using namespace std;

// O(n) time | O(n) space
int waterArea(vector<int> heights) {
  vector<int> maxes(heights.size(), 0);
  int leftMax = 0;
  for (int i = 0; i < heights.size(); i++) {
    int height = heights[i];
    maxes[i] = leftMax;
    leftMax = max(leftMax, height);
  }
  int rightMax = 0;
  for (int i = heights.size() - 1; i >= 0; i--) {
    int height = heights[i];
    int minHeight = min(rightMax, maxes[i]);
    if (height < minHeight) {
      maxes[i] = minHeight - height;
    } else {
      maxes[i] = 0;
    }
    rightMax = max(rightMax, height);
  }
  int total = 0;
  for (int i = 0; i < heights.size(); i++) {
    total += maxes[i];
  }
  return total;
}
