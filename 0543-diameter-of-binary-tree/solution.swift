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
    var maxDiameter = Int.min
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        solve(root)
        return maxDiameter
    }

    func solve(_ node: TreeNode?) -> Int {
        // Base Case
        if node == nil {
            return 0
        }
        // Ask Left Child
        let left = solve(node?.left)
        // Ask Right Child
        let right = solve(node?.right)
        // Combine Left + Right + Current Node
        maxDiameter = max(maxDiameter, left+right)
        return max(left,right)+1
    }
}
