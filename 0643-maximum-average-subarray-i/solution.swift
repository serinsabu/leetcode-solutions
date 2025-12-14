class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var i=0;
        var j=0;
        var n = nums.count;
        var sum: Double = 0
        var maxAvg = -Double.infinity

        while j < n {
            sum += Double(nums[j])

            if(j-i+1 == k) {
                maxAvg = max(maxAvg, sum / Double(k))
                sum -= Double(nums[i])
                i += 1
            }
            j += 1
        }
        return maxAvg
    }
}
