class Solution {
    public int minPairSum(int[] nums) {
        int n = nums.length;
        Arrays.sort(nums);
        int maxVal = Integer.MIN_VALUE;
        //[2,3,3,5]=(0, 2+5)=7=>(7,(3+3))
        for(int i=0; i<n; i++) {
            maxVal = Math.max(maxVal, (nums[i]+nums[n-i-1]));
        }
        return maxVal;
    }
}
