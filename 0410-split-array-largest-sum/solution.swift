class Solution {
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var low = nums.max()!

        var sum = 0
        for num in nums {
            sum += num
        }
        var high = sum
        var ans = 0

        while low <= high {
            var mid = (low+high)/2
            // try different mids -> mid represents largest allowed subarray sum
            // if we are getting equal subarrays as k then ask for more, move right
            // we try SMALLER answer
            if canSplit(mid) {
                ans = mid
                high = mid-1
            } else {
                low = mid+1
            }
        }
        return ans

        func canSplit(_ val: Int) -> Bool {
            // total subarrays we can make with the max allowed subarray sum 'val' we have
            var totalSubarrays = 1
            var sum = 0
            for num in nums {
                // Keep adding nums into current subarray
                // start new subarray
                if sum + num > val {
                    sum = num
                    totalSubarrays += 1
                } else {
                    sum += num
                }
            }
            // the totalsubarrays are greater than given k then that val is not possible
            return totalSubarrays <= k
        }
    }
}
