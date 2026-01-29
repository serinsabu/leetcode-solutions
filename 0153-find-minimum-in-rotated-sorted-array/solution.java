class Solution {
    public int findMin(int[] nums) {
        int n = nums.length;
        int low = 0;
        int high = n-1;

        while(low < high) {
            int mid = (low+high)/2;
            if(nums[mid] > nums[high]) {
                // go to right
                low = mid+1;
            } else if (nums[mid] <= nums[high]) {
                // go to left
                high = mid;
            }
        }
        return nums[low];
    }
}
