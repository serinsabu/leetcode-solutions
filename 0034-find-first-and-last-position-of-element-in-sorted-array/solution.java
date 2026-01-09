class Solution {
    public int[] searchRange(int[] nums, int target) {
        int n = nums.length;
        int[] ans = new int[2];
        int low = 0;
        int high = n-1; 
        int first = -1;
        int last = -1;

        // lower bound
        while(low <= high) {
            int mid = (low+high)/2;
            if(nums[mid] >= target) {
                first = mid;
                high = mid-1;
            } else {
                low = mid+1;
            }
        }
        if(first != -1 && nums[first] == target) {
            ans[0] = first;
        } else {
            ans[0] = -1;
        }
        low = 0;
        high = n-1;
        // upper bound
        while(low <= high) {
            int mid = (low+high)/2;
            if(nums[mid] <= target) {
                last = mid;
                low = mid+1;
            } else {
                high = mid-1;
            }
        }
        if(last != -1 && nums[last] == target) {
            ans[1] = last;
        } else {
            ans[1] = -1;
        }
        return ans;
    }
}
