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
    var ans = [String]()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        solve(root, "")
        return ans
    }

    func solve(_ node: TreeNode?, _ path: String) {
        var path = path
        guard let node = node else {
            return
        }

        let oldPath = path
        if path == "" {
            path += String(node.val)
        } else {
            path += "->\(String(node.val))"
        }
        // if leaf then append
        if node.left == nil && node.right == nil {
            ans.append(path)
        }
        solve(node.left, path)
        solve(node.right, path)
        path = oldPath
    }
}
