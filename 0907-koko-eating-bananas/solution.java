class Solution {
    public int minEatingSpeed(int[] piles, int h) {
        int n = piles.length;
        int low = 1;
        int maxVal = Integer.MIN_VALUE;
        int ans = 0;
        
        for(int i=0; i<n; i++) {
            maxVal = Math.max(maxVal, piles[i]);
        }
        int high = maxVal;

        while(low <= high) {
            int mid = low+(high-low)/2;
            if(canEat(piles, mid, h)) {
                // min k, so for min keep going left
                ans = mid;
                high = mid-1;
            } else {
                low = mid+1;
            }
        }
        return ans;
    }

    public boolean canEat(int[] piles, int speed, int h) {
        int totalHrs = 0;
        int n = piles.length;
        for(int pile=0; pile<n; pile++) {
            // Each pile takes some number of hours, depending on speed
            totalHrs += (int)(Math.ceil((double)piles[pile]/(double)speed));
            // System.out.print(totalHrs);
            if(totalHrs > h) {
                return false;
            }
        }
        return true;
    }
}
