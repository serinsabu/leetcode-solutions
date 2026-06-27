class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var n = nums.count
        var i=0
        var j=0
        var count = 0
        var sum = 0

        while j < n {
            sum += nums[j]

            // invalid
            while sum * (j-i+1) >= k {
                sum -= nums[i]
                i += 1
            } 
            count += j-i+1
            j += 1
        }
        return count
    }
}
