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
    public int sumRootToLeaf(TreeNode root) {
        if(root == null) {
            return 0;
        }
        // start with currsum=0 and root node
        return buildSum(0, root);
    }

    public int buildSum(int currSum, TreeNode root) {
        if(root == null) {
            return 0;
        }
        // basically left shifting (multiplying by 2) instead of converting into string
        currSum = currSum * 2 + root.val;
        // check if it is leaf node, if yes return the accumulated current sum
        if(root.left == null && root.right == null) {
            return currSum;
        } else {
            // pass current , because current should continue, not reset from 0 
            return buildSum(currSum, root.left) + buildSum(currSum, root.right);
        }
    }
}
