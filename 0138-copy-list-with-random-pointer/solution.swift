/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let node = head else {
            return nil
        }
        var dict = [Node: Node]()
        
        func dfs(_ node: Node?) -> Node? {
            guard let node = node else {
                return nil
            }
            // case 1 : if cloned node return right away
            if let clone = dict[node] {
                return clone
            }
            // case 2: if not cloned, create the cloned node
            let clonedNode = Node(node.val)
            // store it right away
            dict[node] = clonedNode

            // connect next node and random node to cloned next and random
            clonedNode.next = dfs(node.next)
            clonedNode.random = dfs(node.random)
            return clonedNode
        }
    return dfs(node)
    }
}
