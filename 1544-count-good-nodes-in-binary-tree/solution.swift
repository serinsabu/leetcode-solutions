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
    func goodNodes(_ root: TreeNode?) -> Int {
        var maxSoFar = Int.min
        return dfs(root, maxSoFar)
    }

    func dfs(_ node: TreeNode?, _ val: Int) -> Int {
        var count = 0
        var val = val
        guard let node = node else {
            return 0
        }
        
        if node.val >= val  {
            val = node.val
            count += 1
        } 
        var left = dfs(node.left, val)
        var right = dfs(node.right, val)
        return left + right + count
    }
}
