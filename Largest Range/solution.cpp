#include <vector>
#include <unordered_map>

using namespace std;

// O(n) time | O(n) space
vector<int> largestRange(vector<int> array) {
  vector<int> bestRange = {}l
  int longestLength = 0;
  unordered_map<int, bool> nums = {};
  for (int num : array) {
    nums[num] = true;
  }
  for (int num : array) {
    if (!nums[num]) {
      continue;
    }
    nums[num] = false;
    int = currentLength = 1;
    int left = num - 1;
    int right = num + 1;
    while (nums.find(left) != nums.end()) {
      nums[left] = false;
      currentLength++;
      left--;
    }
    while (nums.find(right) != nums.end()) {
      nums[right] = false;
      currentLength++;
      right++;
    }
    if (currentLength > longestLength) {
      longestLength = currentLength;
      bestRange = {left + 1, right - 1};
    }
  }
  return bestRange;
}
