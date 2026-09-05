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
    var diameter = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        solve(root)
        return diameter
    }

    func solve(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        // 1. Calculate the diameter passing through the current node → left + right
        // 2. Keep track of the largest diameter found anywhere so far
        let left = solve(node.left) // height of left
        let right = solve(node.right) // height of right
        // The path between two nodes through node 2 is: 4->2->5
        // no of edges is diameter
        // 4 ── 2 ── 5
        //    ↑     ↑
        //   edge   edge
        diameter = max(diameter, left + right)
        return 1 + max(left, right) // height
    }
}
