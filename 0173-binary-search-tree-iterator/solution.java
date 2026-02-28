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
class BSTIterator {
    List<Integer> list = new ArrayList<>();
    int curr = 0;

    public void inorder(TreeNode root, List<Integer> list) {
        if(root == null) {
            return;
        }
        //LRR
        inorder(root.left, list);
        list.add(root.val);
        inorder(root.right, list);
    }

    public BSTIterator(TreeNode root) {
        inorder(root, list);
    }
    
    public int next() {
        //get next node 
        return list.get(curr++);
    }
    
    public boolean hasNext() {
        return curr < list.size();
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator obj = new BSTIterator(root);
 * int param_1 = obj.next();
 * boolean param_2 = obj.hasNext();
 */
