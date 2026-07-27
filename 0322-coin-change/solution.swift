class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var n = coins.count
        var dp = Array(repeating: amount+1, count: amount+1)
        dp[0] = 0

        for i in 0...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], 1 + dp[i-coin])
                }
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
