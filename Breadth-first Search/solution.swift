class Program {
    class Node {
        var name: String
        var children: [Node]

        init(name: String) {
            self.name = name
            children = []
       }

       func addChild(name: String) -> Node {
           let childNode = Node(name: name)
           children.append(childNode)

           return self
       }

       // O(v + e) | O(v) space
       func breadthFirstSearch(array: inout [String]) -> [String] {
           var queue = [self]

           while queue.count > 0 {
               let currentNode = queue.removeFirst()
               array.append(currentNode.name)

               for child in currentNode.children {
                   queue.append(child)
               }
           }

           return array
       } 
    }
}