/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        // “For every node, check if p and q exist in its left subtree and right subtree.”
        // case 1
        // p in left subtree
        // q in right subtree
        if(root == null || root == p || root == q) {
            return root;
        }
        // case 2
        // both p and q in left subtree
        TreeNode left = lowestCommonAncestor(root.left, p, q);
        // case 3
        // both p and q in right subtree
        TreeNode right = lowestCommonAncestor(root.right, p, q);

        if(left == null) {
            return right;
        } else if(right == null) {
            return left;
        } else {
            return root;
        }
    }
}
