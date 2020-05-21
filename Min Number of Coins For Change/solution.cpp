#include <vector>
#include <climits>
#include <algorithm>

using namespace std;

// O(nd) time | O(n) space
int minNumberOfCoinsForChange(int n, vector<int> denoms) {
  vector<int> numOfCoins(n + 1, INT_MAX);
  numOfCoins[0] = 0;
  int toCompare = 0;
  for (int denom : denoms) {
    for (int amount = 0; amount < numOfCoins.size(); amount++) {
      if (denom <= amount) {
        if (numOfCoins[amount - denom] == INT_MAX) {
          toCompare = numOfCoins[amount - denom];
        } else {
          toCompare = numOfCoins[amount - denom] + 1;
        }
        numOfCoins[amount] = min(numOfCoins[amount], toCompare);
      }
    }
  }
  return numOfCoins[n] != INT_MAX ? numOfCoins[n] : -1;
}