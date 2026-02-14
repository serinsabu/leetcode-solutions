class Solution {
    public int jump(int[] nums) {
        int n = nums.length;
        int jumps = 0;
        int curr = 0;
        int maxReach = 0;

        for(int i=0; i<n-1; i++) {//4
            maxReach = Math.max(maxReach, i+nums[i]);//4
            if(i == curr) {
                jumps++;//3
                curr = maxReach;//4
            } 
        }
        return jumps;
    }
}
