class Solution {
    public int findMaxConsecutiveOnes(int[] nums) {
        int n = nums.length;
        int j=0;
        int count = 0;
        int maxCount = 0;

        while(j < n) {
            if(nums[j] == 1) {
                count++;
            } else {
                count = 0;
            }
            maxCount = Math.max(maxCount, count);//2
            j++;
        }
        return maxCount;
    }
}
