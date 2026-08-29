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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return solve(root) != -1
    }

    func solve(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        var leftHeight = solve(node.left)
        var rightHeight = solve(node.right)

        if leftHeight == -1 || rightHeight == -1 {
            return -1
        }

        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }

        return 1 + max(leftHeight, rightHeight)
    }
}
