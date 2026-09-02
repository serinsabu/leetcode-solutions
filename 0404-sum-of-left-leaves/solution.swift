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
    // var sum = 0 
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return solve(root, 0)
    }

    func solve(_ node: TreeNode?, _ sum: Int) -> Int {
        var sum = sum
        guard let node = node else {
            return sum
        }
        // left 
        if let left = node.left {
            // if left is leaf
            if left.left == nil && left.right == nil {
                sum += left.val
                print("sum \(sum)")
            }
        }
                
        sum = solve(node.left, sum)
        sum = solve(node.right, sum)
        return sum
    }
}
