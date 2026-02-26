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
    public int countNodes(TreeNode root) {
        if(root == null) {
            return 0;
        }
        TreeNode curr = root;
        int leftHeight = 1;//counting root level
        // keep on going left until leaf node, keep counting left height
        while(curr.left != null) {
            leftHeight ++;
            curr = curr.left;
        }

        curr = root;
        // same as left height
        int rightHeight = 1;//counting root level
        while(curr.right != null) {
            rightHeight ++;
            curr = curr.right;
        }
        if(leftHeight == rightHeight) {
            // tree is perfect
            return (1 << leftHeight) - 1;//2^h − 1 nodes
        } else {
            // if tree is not perfect then count recursively -> 1 + left subtree + right
            return 1 + countNodes(root.left) + countNodes(root.right);
        }
    }
}
