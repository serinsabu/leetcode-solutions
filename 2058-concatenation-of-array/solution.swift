class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        // ans[i] = nums[i]
        // ans[i+n] = nums[i+1]
        var n = nums.count
        var ans = Array(repeating: 0, count: 2*n)
        for i in 0..<n {
            ans[i] = nums[i]//ans[0]=nums[0]
            ans[i+n] = nums[i]//ans[0+3]=nums[0]
        }
        return ans
    }
}
