class Solution {
    func rob(_ nums: [Int]) -> Int {
        var n = nums.count
        var ans = 0
        // when only 1 element 
        if n == 0 {
            return 0
        }   
        if n == 1 {
            return nums[0]
        }   
        if n == 2 {
            return max(nums[0], nums[1])
        } 
        var first = nums[0]
        var second = max(nums[0], nums[1])
        var i = 2
        // rob only adjacent houses
        while i < n {
            // max(pick current , not pick current)
            // take house best so far
            ans = max(nums[i] + first, second)
            first = second
            second = ans
            i += 1
        }
        //dp[2]= max(nums[2]+dp[0], dp[1])=max(4,2)
        return ans
    }
}
