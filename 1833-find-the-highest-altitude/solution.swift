class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var n = gain.count
        var ans = Array(repeating: 0, count: n+1)
        var maxAns = 0
        ans[0] = 0

        for i in 1...n {
            ans[i] = ans[i-1] + gain[i-1]
            maxAns = max(maxAns, ans[i])
        }
        return maxAns
    }
}
