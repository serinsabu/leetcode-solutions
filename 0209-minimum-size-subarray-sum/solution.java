class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int i=0;
        int j=0;
        int sum = 0;
        int minSize = Integer.MAX_VALUE;

        while(j < n) {
            sum += nums[j];

            while(sum >= target) {
                minSize = Math.min(minSize, j-i+1);
                sum -= nums[i];
                i++;
            }
            j++;
        }
        return minSize == Integer.MAX_VALUE ? 0 : minSize;
    }
}
