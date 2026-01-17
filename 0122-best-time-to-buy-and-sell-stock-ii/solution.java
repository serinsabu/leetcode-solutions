class Solution {
    public int maxProfit(int[] prices) {
        int n = prices.length;
        int profit = 0;

        for(int i=1; i<n; i++) {
            if(prices[i-1] <= prices[i]) {
                // if less, calculate profit and move on to new element
                profit += prices[i] - prices[i-1];//5-1=4,6-3=3
            }
        }
        return profit;
    }
}
