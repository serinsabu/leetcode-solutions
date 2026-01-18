class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var n = nums.count
        var i=0
        var j=0
        var sum = 0
        var minLen = Int.max

        while(j < n) {
            sum += nums[j]

            while(sum >= target) {
                minLen = min(minLen, j-i+1)
                sum -= nums[i]
                i += 1
            }
            j += 1 
        }
        return minLen == Int.max ? 0 : minLen
    }
}
