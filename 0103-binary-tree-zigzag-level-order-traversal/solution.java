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
    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();
        if(root == null) {
            return res;
        }
        Queue<TreeNode> q = new LinkedList<>();
        q.offer(root);
        boolean isLeftToRight = true;

        while(!q.isEmpty()) {
            int size = q.size();
            List<Integer> ans = new LinkedList<Integer>();
            for(int i=0; i<size; i++) {
                TreeNode curr = q.poll();
                if(curr.left != null) {
                    q.offer(curr.left);
                }

                if(curr.right != null) {
                    q.offer(curr.right);
                }
                // instead of level, you can use boolean to track what to insert first
                if(!isLeftToRight) {//not left to right so end will come at beginning R-L
                    ans.addFirst(curr.val);
                } else {//L -> R
                    ans.addLast(curr.val);
                }
            }
            res.add(ans);
            // change the direction
            isLeftToRight = !isLeftToRight;
        }
        return res;
    }
}
