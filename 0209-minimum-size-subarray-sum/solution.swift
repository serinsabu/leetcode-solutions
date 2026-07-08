class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var n = nums.count
        var i=0
        var j=0
        var minLength = Int.max
        var currSum = 0

        while j < n {
            currSum += nums[j]//2

            // invalid
            while currSum >= target {
                minLength = min(minLength, j-i+1)
                currSum -= nums[i]
                i += 1
            }
            j += 1
        }
        return minLength == Int.max ? 0 : minLength
    }
}
