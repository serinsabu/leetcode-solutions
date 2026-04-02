class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var minVal = prices.max()!
        var n = prices.count

        for i in 0..<n {
            if prices[i] < minVal {
                minVal = prices[i]
            } else {
                profit = max(profit, prices[i] - minVal)//4
            }
        }
        return profit
    }
}
