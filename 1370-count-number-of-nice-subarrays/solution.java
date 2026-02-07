class Solution {
    public int numberOfSubarrays(int[] nums, int k) {
        return atmost(nums, k) - atmost(nums, k-1);
    }

    int atmost(int[] nums, int k) {
        int i=0;
        int j=0;
        int oddCount = 0;
        int ans = 0;
        int n = nums.length;

        while(j < n) {
            if(nums[j]%2 == 1) {
                oddCount++;
            }

            while(oddCount > k) {
                // shrink the window
                if(nums[i]%2 == 1) {
                    oddCount--;
                }
                i++;
            }
            ans += j-i+1;
            j++;
        }
        return ans;
    }
}
