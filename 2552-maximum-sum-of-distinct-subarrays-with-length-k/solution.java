class Solution {
    public long maximumSubarraySum(int[] nums, int k) {
        long maxSum = 0;
        int n = nums.length;

        Set<Integer> set = new HashSet<>();

        long sum = 0;
        int i=0;
        int j=0;

        while(j < n) {
            // remove the number from set until it is removed fully, even the duplicates
            while(set.contains(nums[j])) {
                set.remove(nums[i]);
                sum -= nums[i];
                i++;
            }
            set.add(nums[j]);
            sum += nums[j];

            if(j-i+1 == k) {
                maxSum = Math.max(maxSum, sum);

                set.remove(nums[i]);
                sum -= nums[i];
                i++;
            }
            j++;
        }
        return maxSum;
    }
}
