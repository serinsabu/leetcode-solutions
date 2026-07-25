/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        // Original Node -> Cloned Node
        var dict = [Node: Node]()
        func dfs(_ node: Node?) -> Node? {

            // 1. What if node is nil?
            // Base Case 1
            guard let node = node else {
                return nil
            }

            // 2. What if it's already cloned?
            // Base Case 2
            if let cloned = dict[node] {
                return cloned
            }

            // 3. Create clone
            let clone = Node(node.val)

            // 4. Store in dictionary
            dict[node] = clone

            // 5. Clone neighbours
            for neighbour in node.neighbors {
                clone.neighbors.append(dfs(neighbour))
            }

            // 6. Return clone
            return clone
        }
        // 5. Return clone
        return dfs(node)
    }
    
}
