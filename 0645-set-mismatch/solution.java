class Solution {
    public int[] findErrorNums(int[] nums) {
        int n = nums.length;
        int[] ans = new int[2];
        Arrays.sort(nums);
        
        for(int i=1; i<n; i++) {
            if(nums[i-1] == nums[i]) {
                //duplicate
                ans[0] = nums[i];
                break;
            }
        }

        // missing 
        int totalSum = 0;
        totalSum = (n * (n+1))/2;

        int sumOfActualNums = 0;
        for(int i=0; i<n; i++) {
            sumOfActualNums += nums[i];
        }
        ans[1] = totalSum - (sumOfActualNums - ans[0]);
        
        return ans;
    }
}
