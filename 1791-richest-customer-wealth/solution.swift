class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        // Row Sum + Track maximum
        var maxAns = 0

        for i in 0..<accounts.count {
            var sum = 0
            for j in 0..<accounts[0].count {
                sum += accounts[i][j]
            }
            maxAns = max(maxAns, sum)
        }
        return maxAns
    }
}
