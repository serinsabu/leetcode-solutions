class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var n = nums.count

        func atmost(_ k: Int) -> Int {
            if k < 0 { return 0 } // crashes, if it is not given when goal = 0
            var i=0
            var j=0
            var sum = 0
            var count = 0
            while j < n {
                sum += nums[j]//3
                // this pattern is subarray sum <= k
                while sum > k {
                    sum -= nums[i]
                    i += 1
                }
                count += j-i+1//2
                j += 1//4
            }
            return count
        }
        return atmost(goal) - atmost(goal-1)
    }
}
