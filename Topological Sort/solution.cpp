#include <vector>
#include <unordered_map>
#include <algorithm>

using namespace std;

class JobNode {
public:
  int job;
  vector<JobNode *> deps:
  int numOfPrereqs;

  JobNode(int job);
};

class JobGraph {
public:
  vector<JobNode *> nodes;
  unordered_map<int, JobNode *> graph;

  JobGraph(vector<int> jobs);
  void addDep(int job, int dep);
  void addNode(int job);
  JobNode = *getNode(int job);
};

JobsGraph *createJobGraph(vector<int> jobs, vector<vector<int>> deps);
vector<int> getOrderedJob(JobGraph *graph);
void removeDeps(JobNode *node, vector<JobNode *> *nodesWithNoPrereqs);

// O(j + d) time | O(j + d) space
vector<int> topologicalSort(vector<int> jobs, vector<vector<int>> deps) {
  JobGraph *jobGraph = createJobGraph(jobs, deps);
  return getOrderedJobs(jobGraph);
}

JobGraph *createJobGraph(vector<int> jobs, vector<vector<int>> deps) {
  JobGraph *graph = new JobGraph(jobs);
  for (vector<int> dep : deps) {
    graph->addDep(dep[0], dep[1]);
  }
  return graph;
}

vector<int> getOrderedJob(JobGraph *graph) {
  vector<int> orderedJobs = {};
  vector<JobNode *> nodesWithNoPrereqs(graph->nodes.size());
  auto it = copy_if(graph->nodes.begin(), graph->nodes.end(),
                    nodesWithNoPrereqs.begin(),
                    [](JobNode *node) { return node->numOfPrereqs == 0; });
  nodesWithNoPrereqs.resize(distance(nodesWithNoPrereqs.begin(), it));
  while (nodesWithNoPrereqs.size()) {
    JobNode *node = nodesWithNoPrereqs.back();
    nodesWithNoPrereqs.pop_back();
    orderedJobs.push_back(node->job);
    removeDeps(node, &nodesWithNoPrereqs);
  }
  bool graphHasEdges = false;
  for (JobNode *node : graph->nodes) {
    if (node->numOfPrereqs) {
      graphHasEdges = true;
    }
  }
  return graphHasEdges ? vector<int>{} : orderedJobs;
}








































