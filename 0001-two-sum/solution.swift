class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var n = nums.count
        var ans = [Int](repeating: 0, count: 2)
        var map:[Int: Int] = [:]

        for i in 0..<n {
            let complement = target - nums[i]

            if let index = map[complement] {
                ans[0] = i
                ans[1] = index
            }
            map[nums[i]] = i
        }
        return ans
    }
}
