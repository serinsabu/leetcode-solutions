class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var ans = Array(repeating: 0, count: n)
        var prefixElt = 1

        for i in 0..<n {
            ans[i] = prefixElt
            prefixElt *= nums[i]
        }

        var suffix = 1

        for i in stride(from: n-1, through: 0, by: -1) {
            ans[i] *= suffix
            suffix *= nums[i]
        }
        return ans
    }
}
