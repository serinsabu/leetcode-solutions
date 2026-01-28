class Solution {
    public int search(int[] nums, int target) {
        int n = nums.length;
        int low = 0;
        int high = n-1;

        while(low <= high) {
            int mid = (low+high)/2;
            if (nums[mid] == target) return mid;
            // first find sorted half and then apply binary search on that 
            if(nums[low] <= nums[mid]) {
                // first of all check target is present in the sorted half or not
                if (target >= nums[low] && target <= nums[mid]) {
                    //
                    high = mid-1;
                } else {
                    // check in the left half
                    low = mid+1;
                }
            } else {
                if (target >= nums[mid] && target <= nums[high]) {
                    // check in the right half
                    low = mid+1;
                } else {
                    // check in the left half
                    high = mid-1;
                }
            }
        }
        return -1;
    }
}
