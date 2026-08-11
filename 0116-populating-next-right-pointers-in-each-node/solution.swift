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
            return nil
        }

        root.left?.next = root.right
        // this will automatically handle nil check and point the last node next to nil
        // as the root.next is already optional and if its nil it equals to nil
        root.right?.next = root.next?.left
        connect(root.left)
        connect(root.right)
        return root
    }
}
