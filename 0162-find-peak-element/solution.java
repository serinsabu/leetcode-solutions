class Solution {
    public int findPeakElement(int[] nums) {
        int n = nums.length;
        int low = 0;
        int high = n-1;

        while(low <= high) {
            int mid = (low+high)/2;
            // peak element
            if(
                ((mid == 0) || nums[mid-1] < nums[mid]) && 
                ((mid == n-1) || nums[mid+1] < nums[mid])
            ) {

                return mid;
            //1 2 3, 3 2 1, 3 1 2, 2 1 3
            //peak -> 2 3 1, 1 3 2
            } else if(
               (nums[mid+1] > nums[mid])
                ) {
                // not a peak
                low = mid+1;
            } else {
                high = mid-1;
            }
        }
        return -1;
    }
}
