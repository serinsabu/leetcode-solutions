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
    var maxSum = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        solve(root)
        return maxSum 
    }

    func solve(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        // Ask Left Child
        var left = solve(node?.left)
        // Ask Right Child
        var right = solve(node?.right)
        left = max(left, 0)
        right = max(right, 0)
        maxSum = max(maxSum, left+right+node!.val)
        // Combine Left + Right + Current Node
        return max(left,right)+node!.val
    }
}
