class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var ans = Array(repeating: 0, count: n)
        ans[0] = nums[0]

        for i in 1..<n {
            ans[i] = ans[i-1] + nums[i] 
        }
        return ans
    }
}
