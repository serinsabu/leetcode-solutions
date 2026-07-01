class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var n = nums.count
        var totalSum = nums.reduce(0, +)
        
        // for i in 0..<n {
        //     totalSum += nums[i]
        // }
        // variable-size window looking for a target sum.
        // Find the longest subarray with sum total-x
        var target = totalSum - x
        if target < 0 {
            return -1
        }
        var i=0
        var j=0
        var sum = 0
        var maxLen = Int.min

        while j < n {
            sum += nums[j]

            // invalid
            while sum > target {
                sum -= nums[i]
                i += 1
            }
            // when its exactly equal to target then it reduces to 0, so find max len 
            if sum == target {
                maxLen = max(maxLen, j-i+1)
            }
            j += 1
        }
        return maxLen == Int.min ? -1 : n - maxLen
    }
}
