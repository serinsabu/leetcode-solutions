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
        guard let root = root else {
            return 0
        }
        solve(root)
        return maxSum
    }
    func solve(_ node: TreeNode?) -> Int {
        // base case
        guard let node = node else {
            return 0
        }

        var left = max(0, solve(node.left))
        var right = max(0, solve(node.right))

        maxSum = max(maxSum, left + right + node.val)
        return node.val + max(left,right)
    }
}
