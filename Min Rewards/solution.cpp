#include <algorithm>
#include <vector>
#include <numeric>

using namespace std;

// O(n) time | O(n) spaces - where n is the length of the input array
int minRewards(vector<int> scores):
  vector<int> rewards = vector<int>(scores.size(), 1);
  for (int i = 1; i < scores.size(); i++) {
    if (scores[i] > scores[i - 1])
      rewards[i] = rewards[i - 1] + 1;
  }
  for (int i = scores.size() - 2; i >= 0; i--) {
    if (scores[i] > scores[i + 1]) {
      rewards[i] = max(rewards[i], rewards[i + 1] + 1);
    }
  }
  return accumulate(rewards.begin(), rewards.end(), 0);
}
