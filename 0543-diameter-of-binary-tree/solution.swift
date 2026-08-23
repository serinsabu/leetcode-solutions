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
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var diameter = 0
        solve(root, &diameter)
        return diameter
    }

    func solve(_ node: TreeNode?, _ diameter: inout Int) -> Int {
        //var diameter = diameter
        guard let node = node else {
            return 0
        }

        var leftHeight = solve(node.left, &diameter)
        var rightHeight = solve(node.right, &diameter)
        diameter = max(diameter, leftHeight + rightHeight)
        return 1 + max(leftHeight, rightHeight)
    }
}
