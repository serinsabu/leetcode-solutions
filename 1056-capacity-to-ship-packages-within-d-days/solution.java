class Solution {
    public int shipWithinDays(int[] weights, int days) {
        int n = weights.length;
        int sum = 0;
        int maxVal = Integer.MIN_VALUE;
        for(int i=0; i<n; i++) {
            maxVal = Math.max(maxVal, weights[i]);
        }
        for(int i=0; i<n; i++) {
            sum += weights[i];
        }
        int low = maxVal;
        int high = sum;
        int ans = 0;

        while(low <= high) {
            int mid = low+(high-low)/2;//ship capacity
            if(canLoad(weights, mid, days)) {
                ans = mid;
                high = mid-1;
            } else {
                low = mid+1;
            }
        }
        return ans;
    }

    public boolean canLoad(int[] weights, int minCap, int days) {
        int totalCap = 0;
        int day = 1;
        int n = weights.length;
        for(int pack=0; pack < n; pack++) {
            totalCap += weights[pack];
            // # too heavy, wait for the next day
            if(totalCap > minCap) {
                totalCap = weights[pack];
                day++;
                if(day > days) {
                    return false;
                }
            }
        }
        return true;
    }
}
