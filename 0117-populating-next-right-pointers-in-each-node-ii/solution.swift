/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return root
        }

        var curr: Node? = root // starting node

        while curr != nil {
            // create a dummy node whose next points to the first child you find
            var dummy = Node(0)
            var tail = dummy

            while curr != nil {
                if let left = curr?.left {
                    tail.next = left
                    // tail = tail.next optional issue
                    tail = left
                }
                if let right = curr?.right {
                    tail.next = right
                    // tail = tail.next optional issue
                    tail = right
                }
                curr = curr?.next
            }
            // dummy.next = first node of NEXT level
            curr = dummy.next
        }
        return root
    }
}
