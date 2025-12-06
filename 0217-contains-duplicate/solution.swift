class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in 0..<nums.count {
            if set.contains(nums[i]) {
                return true
            } else {
                set.insert(nums[i])
            }
        }
        return false
    }
}
