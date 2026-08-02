class Solution {
    func stoneGame(_ piles: [Int]) -> Bool {
        var n = piles.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        // Base case default - fill the table 
        for i in 0..<n {
            dp[i][i] = piles[i]
        }

        // Now interval length
        for len in 2...n {
            // For every interval
            for left in 0...(n-len) {
                // choice 1 - take left
                // choice 2 - take right
                // max(choice1, choice2)
                let right = left + len - 1
                let takeLeft = piles[left] - dp[left+1][right]
                let takeRight = piles[right] - dp[left][right-1]
                dp[left][right] = max(takeLeft,takeRight) 
            }
        }
        // If dp[0][n-1] > 0 , current player ( alice ) has a larger score than Bob
        return dp[0][n-1] > 0
    }
}
