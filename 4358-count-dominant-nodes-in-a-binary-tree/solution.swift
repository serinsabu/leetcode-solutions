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
    func countDominantNodes(_ root: TreeNode?) -> Int {
        return dfs(root).count
    }

    func dfs(_ node: TreeNode?) -> (maxVal: Int, count: Int) {
        var count = 0
        guard let node = node else {
            return (Int.min, 0)
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        let subtreeMax = max(node.val, max(left.maxVal,right.maxVal))
        if node.val == subtreeMax {
            count += 1
        }
        return (subtreeMax, (left.count + right.count + count))
    }
}
