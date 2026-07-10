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
    // abs(left - right) <= 1
    func isBalanced(_ root: TreeNode?) -> Bool {
        // Base Case
        if root == nil {
            return true
        }
        return solve(root) == -1 ? false : true
    }

    func solve(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        // Ask Left Child
        let left = solve(node?.left)
        // Ask Right Child
        let right = solve(node?.right)
        if left == -1 || right == -1 {
            return -1
        }
        if abs(left - right) > 1 {
            return -1
        }
        // Combine Left + Right + Current Node
        return max(left,right)+1
    }
}
