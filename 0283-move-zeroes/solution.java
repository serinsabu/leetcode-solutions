class Solution {
    public void moveZeroes(int[] nums) {
        int n = nums.length;
        int res = 0;

        for(int i=0; i<n; i++) {
            if(nums[i] != 0) {
                // swap with res
                int temp = nums[i];
                nums[i] = nums[res];
                nums[res] = temp;
                res ++;//2
            }
        }
    }
}
