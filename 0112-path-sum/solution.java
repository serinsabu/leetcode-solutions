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
    public boolean hasPathSum(TreeNode root, int targetSum) {
        if(root == null) {
            return false;
        }
        return recurse(root, targetSum);
    }

    public boolean recurse(TreeNode root, int targetSum) {
        if(root == null) {
            return false;
        } 
        // check for leaf conditon, if leaf node check targetSum == root.val
        if(root.left == null && root.right == null) {
            return targetSum == root.val;
        }
        /*
            When you’re at a node:
            You have two possible directions:
                •	Go left
                •	Go right
            If either side returns true → answer is true.
        */
        return recurse(root.left, targetSum-root.val) || 
               recurse(root.right, targetSum-root.val);
    }
}
