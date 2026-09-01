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
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        return solve(root)
    }

    func solve(_ node: TreeNode?) -> Bool {
        guard let node = node else {
            return false
        }

        let left = solve(node.left)
        let right = solve(node.right)
        // If the node is a leaf node, the evaluation is the value of the node, i.e. True or False.
        if node.left == nil && node.right == nil {
            return node.val == 1
        }
        // Otherwise, evaluate the node's two children and apply the boolean operation of its value with the children's evaluations.
        // The problem guarantees this is a full binary tree, so every non-leaf node has both children.
        // if node.left != nil && node.right != nil {
            if node.val == 2 {
                return left || right
            }
            if node.val == 3 {
                return left && right
            }
        // }
        return false
    }
}
