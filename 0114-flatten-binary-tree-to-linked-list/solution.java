/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public void flatten(TreeNode root) {
        if(root == null) {
            return;
        }
        TreeNode curr = root;
        while(curr != null) {
            // If the current node has a left child:
            if(curr.left != null) {
                TreeNode temp = curr.left;
                // Find the rightmost node of the left subtree.
                while(temp.right != null) {
                    temp = temp.right;
                }
                // Attach that node’s right to the current node’s right subtree.
                temp.right = curr.right;
                // Move the left subtree to the right and set left = null
                curr.right = curr.left;
                curr.left = null;
            }
            // Move to the right child and repeat.
            curr = curr.right;
        }
    }
}
