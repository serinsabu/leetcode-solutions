class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var n=cardPoints.count
        var windowSum = 0
        // get sum of first k curr window
        for i in 0..<k {
            windowSum += cardPoints[i]//6
        }
        var maxSum = windowSum
        //0<3,1<3,2<3
        //k=3, i=0
        //k=4, i=1
        //k=5, i=2
        for i in 0..<k {
            // remove from left and add from right
            // cardPoints[k-1-i] => 3-1-0=2, 3-1-1=1, 3-1-2=0
            // cardPoints[n-1-i] => 7-1-0=6, 7-1-1=5, 7-1-2=4
            windowSum = windowSum - cardPoints[k-1-i] + cardPoints[n-1-i]
            //6-3+1=4, 4-2+6=8, 8-1+5=12
            maxSum = max(maxSum, windowSum)
        }
        return maxSum
    }
}
