class Solution {
    public int removeElement(int[] nums, int val) {
        int n = nums.length;
        int count = 0;
        int j=0;

        for(int i=0; i<n; i++) {
            if(nums[i] != val) {
                nums[j] = nums[i];
                count++;//5
                j++;//5
            } 
        }
        //nums[0] = 0, nums[1] = 1, nums[2] = 3, nums[3] = 0, nums[4] = 4, nums[5]
        return count;
    }
}
