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
        return solve(root)
    }
    // left and right should represent the minimum depth from that child down to a leaf, not simply the number of nodes in the entire subtree.
    func solve(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        var left = solve(node.left)
        var right = solve(node.right)
        // so this means we are adding root node + its left node because questions says path from the root node down to the nearest leaf node
        // same for right
        if left == 0 {
            return 1 + right
        }
        if right == 0 {
            return 1 + left
        }
        return 1 + min(left, right)
    }
}
