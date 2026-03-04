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

class Pair {
    TreeNode node;
    int index;

    Pair(TreeNode node, int index) {
        this.node = node;
        this.index = index;
    }
}
class Solution {
    public int widthOfBinaryTree(TreeNode root) {
        // BFS
        Queue<Pair> q = new LinkedList<>();
        q.add(new Pair(root, 0));
        int maxWidth = 0;

        while(!q.isEmpty()) {
            int size = q.size();
            int firstInd = q.peek().index;
            int lastInd = 0;//keep it 0, as we are doing pair.index - firstInd below

            for(int i=0; i<size; i++) {
                Pair pair = q.poll();
                TreeNode curr = pair.node;
                // to normalize for large deep trees 
                int ind = pair.index - firstInd;
                lastInd = ind;

                if(curr.left != null) {
                    q.add(new Pair(curr.left, ind * 2));
                }
                if(curr.right != null) {
                    q.add(new Pair(curr.right, ind * 2 + 1));
                }
            }
            // remove firstInd as coordinates get affected and it changes result
            maxWidth = Math.max(maxWidth, lastInd + 1);
        }
        return maxWidth;
    }
}
/*
    // to normalize for large deep trees 
    int ind = pair.index - firstInd;

    For ex, 
    [(5,3), (9,6)]

    At that level:
    firstInd = 3 => ind = pair.index - firstInd => For node 5:=3 - 3 = 0
    For node 9:=6 - 3 = 3
    Now indices become:= [(5,0), (9,3)] Width calculation becomes: easier, gives same result
*/
