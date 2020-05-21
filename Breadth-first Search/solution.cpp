#include <vector> 
#include <deque>

using namespace std;

class Node {
public:
  string name;
  vector<Node *> children;
  
  Node(string name) { this->name = name; }

  // O(v + e) time | O(v) space
  vector<string> breadthFirstSearch(vector<string> *array) {
    deque<Node *> queue{this};
    while (!queue.empty()) {
      Node current = *queue.front();
      queue.pop_front();
      array->push_back(current.name);
      for (int i = 0; i < current.children.size(); i++) {
        queue.push_back(current.children[i]);
      }
    }
    return *array;
  }

  Node *addChild(string name) {
    Node *child = new Node(name);
    children.push_back(child);
    return this;
  }
};