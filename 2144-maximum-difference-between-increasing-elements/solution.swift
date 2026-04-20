class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var n = nums.count
        var maxAns = -1
        var minSoFar = nums[0]
        var diff = 0

        // maximize nums[j] - nums[i], means i must be smaller
        // j must be larger
        // Linear Scan + Track Minimum So Far

        for i in 1..<n {
            minSoFar = min(minSoFar, nums[i])//1
            diff = nums[i] - minSoFar//4
            if diff > 0 {
                maxAns = max(maxAns, diff)//-1
            }
        }
        return maxAns
    }
}
