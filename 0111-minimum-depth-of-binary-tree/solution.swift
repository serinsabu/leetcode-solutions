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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return height(root)
    }

    func height(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let left = height(node.left)
        let right = height(node.right)

        // no children
        if node.left == nil && node.right == nil {
            return 1
        }

        // only right child => current node + right
        if node.left == nil {
            return 1 + right
        }

        // only left child => current node + left
        if node.right == nil {
            return 1 + left
        }

        // both children
        return 1 + min(left,right)
    }
}
