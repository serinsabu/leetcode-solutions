class Solution {
    public int pivotIndex(int[] nums) {
        int n = nums.length;
        int totalSum = 0;

        for(int i=0; i<n; i++) {
            totalSum += nums[i];
        }
        /*
        👉 Calculate total sum once.
            Then as you iterate:
                •	Keep track of leftSum
                •	Derive rightSum from total

                totalSum = sum of all elements
                At index i, the array is split into three parts:
                [ left part ]  nums[i]  [ right part ]
                totalSum = leftSum + nums[i] + rightSum

                //REARRANGE to:
                We want rightSum.
                rightSum = totalSum - leftSum - nums[i]
        */
        int leftSum = 0;
        int rightSum = 0;

        for(int i=0; i<n; i++) {
            rightSum = totalSum - leftSum - nums[i];

            if(leftSum == rightSum) {
                return i;
            }
            leftSum += nums[i];
        }
        return -1;
    }
}
