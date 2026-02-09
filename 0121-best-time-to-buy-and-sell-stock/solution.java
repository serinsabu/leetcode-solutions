class Solution {
    public int maxProfit(int[] prices) {
        int n = prices.length;
        int maxProfit = 0;
        int cost = prices[0];//7

        for(int i=1; i<n; i++) {
            // cheapest price till today
            if(prices[i] < cost) {
                // buy -> update the cheapest buy
                cost = prices[i];//1
            } else {
                // sell today
                maxProfit = Math.max(maxProfit, prices[i] - cost);
            }
        }
        return maxProfit;
    }
}
