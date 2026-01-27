class Solution {
    public int minDays(int[] bloomDay, int m, int k) {
        int low = 1;
        int n = bloomDay.length;
        int maxVal = Integer.MIN_VALUE;
        for(int i=0; i<n; i++) {
            maxVal = Math.max(maxVal, bloomDay[i]);
        }
        int high = maxVal;
        int ans = -1;

        if(m*k > n) return -1;

        while(low <= high) {
            int mid = low+(high-low)/2;
            if(canMakeBoquets(bloomDay, mid, m, k)) {
                ans = mid;
                high = mid-1;
            } else {
                low = mid+1;
            }
        }
        return ans;
    }

    public boolean canMakeBoquets(int[] bloomDay, int val, int m, int k) {
        int n = bloomDay.length;
        int numOfBoq = 0;
        int flower = 0;
        for(int i=0; i<n; i++) {
            // here val => currDay
            if(bloomDay[i] <= val) {
                // how many flowers are usable
                flower++;

                if(flower == k) {
                    numOfBoq++;
                    flower = 0;
                    if(numOfBoq == m) {
                        return true;
                    } 
                }
            } else {
                // flowers are not usable, so start from beginning
                flower = 0;
            }
        }
        return false; 
    }
}
