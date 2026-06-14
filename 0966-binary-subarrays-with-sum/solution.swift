class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var n = nums.count

        //subarrays with sum ≤ goal-subarrays with sum ≤ goal-1
        func subarraysWithSum(_ k: Int) -> Int {
            var i=0
            var j=0
            var sum=0
            var count = 0

            if k < 0 {
                return 0
            }

            while j < n {
                sum += nums[j]//2
                while sum > k {
                    sum -= nums[i]
                    i += 1
                }
                if sum <= k {
                    count += j-i+1
                }
                j += 1//2
            }
            return count
        }

        return subarraysWithSum(goal) - subarraysWithSum(goal-1)
    }
}
