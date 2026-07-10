/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {  
        return solve(p, q) 
    }

    func solve(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        // Base Case
        if node1 == nil && node2 == nil {
            return true
        } 
        if node1 == nil && node2 != nil {
            return false
        }
        // Ask Left Child
        let left = solve(node1?.left, node2?.left)
        // Ask Right Child
        let right = solve(node1?.right, node2?.right)
        // Combine Left + Right + Current Node
        return left && right && node1?.val == node2?.val
    }
}
