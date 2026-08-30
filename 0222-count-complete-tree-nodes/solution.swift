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

 /*

 solve(node)
    ↓
find leftmost height
find rightmost height
    ↓
same?
 /   \

YES   NO
 ↓     ↓
2^h-1 solve(left) + solve(right) + 1

 */
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return solve(root)
    }
    // you don’t need to calculate the height of the entire tree separately first.
    // You don’t need to visit every node in that subtree.
    // if leftHeight != rightHeight
    //  The subtree isn’t perfect, so recurse into the left and right children.
    /*
    calculates the height of the whole subtree, which means it visits both sides.
    But for Count Complete Tree Nodes, we specifically want:
    “How deep is the leftmost path?”
    So you only follow one direction.
    */
    func solve(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let lh = leftHeight(node)
        let rh = rightHeight(node)
        var left = 0
        var right = 0

        // perfect tree
        if lh == rh {
            // number of nodes = 2^height - 1
            return Int(pow(2.0, Double(lh))) - 1
        } else { // complete tree
            // recurse
            left = solve(node.left)
            right = solve(node.right)
        }
        return 1+left+right
    }
    //  your leftHeight and rightHeight functions each take O(log n) time because a complete tree has height O(log n).
    func leftHeight(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        var current: TreeNode? = node
        var height = 0
        while current != nil {
            height += 1
            current = current!.left
        }
        return height
    }

    func rightHeight(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        var current: TreeNode? = node
        var height = 0
        while current != nil {
            height += 1
            current = current!.right
        }
        return height
    }
}
