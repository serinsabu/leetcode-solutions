class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var ans = Array(repeating: Int.max, count: amount+1)
        ans[0] = 0

        for i in 0...amount {
            for coin in coins {
                if i >= coin && ans[i-coin] != Int.max {
                    ans[i] = min(ans[i], ans[i-coin]+1)
                }
            }
        }
        return ans[amount] == Int.max ? -1 : ans[amount]
    }
}
