class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var currSum = 0
        var n = cardPoints.count

        // sum of first k elements
        for i in 0..<k {
            currSum += cardPoints[i]
        }

        var maxSum = currSum
        for i in 0..<k {
            // remove leftsum 
            // add right sum
            currSum = currSum - cardPoints[k-i-1] + cardPoints[n-i-1]
            maxSum = max(maxSum, currSum)
        }
        return maxSum
    }
}
