class Solution {
    public int maxProfit(int[] prices) {
        int n = prices.length;
        int currProfit = 0;
        int maxProfit = Integer.MIN_VALUE;
        int min = prices[0];

//At each day, assume today is the sell day and subtract the cheapest price seen so far.

        for(int i=0; i<n; i++) {
            // keep on getting the cheapest price possible
            min = Math.min(min, prices[i]);
            currProfit = prices[i] - min;
            
            maxProfit = Math.max(maxProfit, currProfit);
        }
        return maxProfit;
    }
}
