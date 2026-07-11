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
        if root == nil {
            return root
        }

        // found the node in one of the targets
        if root === p || root === q {
            return root
        }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)

        // case 1 - if both left and right are present then return root
        if left != nil && right != nil {
            return root
        }

        // case 2 - if left = node and right = nil
        if left != nil {
            return left
        }

        // case 3 - if left = nil and right = node
        if right != nil {
            return right
        }
        return nil
    }
}

