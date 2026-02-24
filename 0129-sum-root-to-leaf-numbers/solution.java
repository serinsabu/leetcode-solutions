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
    public int sumNumbers(TreeNode root) {
        if(root == null) {
            return 0;
        }
        return buildSum(0, root);
    }

    public int buildSum(int currSum, TreeNode root) {
        if(root == null) {
            return 0;
        }
        currSum = currSum * 10 + root.val;
            // if leaf node return current sum
        if(root.left == null && root.right == null) {
            return currSum;
        } else {
            // return sum of left and right subtrees
            return buildSum(currSum, root.left) + buildSum(currSum, root.right); 
        }
    }
}
