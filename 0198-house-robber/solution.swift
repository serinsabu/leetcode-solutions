class Solution {
    func rob(_ nums: [Int]) -> Int {
        var n = nums.count
        if n == 0 {
            return 0
        }

        if n == 1 {
            return nums[0]
        }

        if n == 2 {
            return max(nums[1], nums[0])
        }
        var first = 0
        var second = 0
        var ans = 0
        first = nums[0]
        second = max(nums[0], nums[1])
        var i = 2
            while i<n {
                ans = max(second, first + nums[i])
                first = second
                second = ans
                i += 1
            }
        
        return ans
    }
}
