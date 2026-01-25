class Solution {
    public int minimumDifference(int[] nums, int k) {
        int n = nums.length;
        Arrays.sort(nums);//[1,4,7,9]
        int minVal = Integer.MAX_VALUE;
        int i=0;
        // because we want to check for k elements
        int j=k-1;//k size window
        
        while(j < n) {
            int diff = nums[j] - nums[i];
            minVal = Math.min(minVal, diff);
            i++;
            j++;
        }
        return minVal;
    }
}
