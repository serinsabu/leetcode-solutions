class Solution {
    public boolean canJump(int[] nums) {
        int n = nums.length;
        int maxReach = 0;

        /*maxReach = farthest index reachable so far
        If you ever reach an index you can’t get to, the answer is false
        */

        for(int i=0; i<n; i++) {
            if(i > maxReach) {
                return false;
            }
            maxReach = Math.max(maxReach, i+nums[i]);
        }
        return true;
    }
}
