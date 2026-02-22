class Solution {
    public int scoreDifference(int[] nums) {
        int n = nums.length;
        int first = 0;
        int second = 0;
        int scoreDiff = 0;
        boolean isFirst = false;

        for(int i=0; i<n; i++) {
            int val = nums[i];
            // swap once
            if(nums[i]%2 == 1) {
                isFirst = !isFirst;
            }

            // swap again
            if((i+1)%6 == 0) {
                isFirst = !isFirst;
            }

            // first gained
            if(isFirst) {
                second += val;
            } else {
                // second gains
                first += val;
            }
        }
        scoreDiff = first - second;
        return scoreDiff;
    }
}
