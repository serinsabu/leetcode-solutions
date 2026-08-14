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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var list = [Int]()
        var res = [[Int]]()
        guard let root = root else {
            return res
        }
        return solve(root, targetSum, list)
    }
    var res = [[Int]]()
    func solve(_ node: TreeNode?, _ targetSum: Int, _ list: [Int]) -> [[Int]] {
        var list = list
        guard let node = node else {
            return res
        }
        var targetSum = targetSum
        targetSum -= node.val
        list.append(node.val)
        // leaf node and targetsum == 0
        if node.left == nil && node.right == nil && targetSum == 0 {
            res.append(list)
        }
        let left = solve(node.left, targetSum, list)//0+5
        let right = solve(node.right, targetSum, list)//
        list.removeLast()
        return res
    }
}
