/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return root
        }

        if root === p || root === q {
            return root
        }
        var left = lowestCommonAncestor(root.left, p, q)
        var right = lowestCommonAncestor(root.right, p, q)
        
        // if both are present, return root
        if left != nil && right != nil {
            return root
        }

        // if left is present, return left
        if left != nil {
            return left
        }

        // if right is present , return right
        if right != nil {
            return right
        }
        return nil
    }
}
