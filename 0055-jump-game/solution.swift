class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0
        for i in 0..<nums.count {
            if i <= maxReach {
                maxReach =  max(maxReach, i + nums[i])
            }
        }
        return maxReach >= nums.count - 1
    }
}
