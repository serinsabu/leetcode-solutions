class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var n = nums.count
        var i=0
        var j=n-1
        var k=n-1

        var ans = Array(repeating: 0, count: n)

        while(i <= j) {
            if abs(nums[i]) > abs(nums[j]) {
                ans[k] = nums[i] * nums[i]
                i += 1
            } else {
                ans[k] = nums[j] * nums[j]
                j -= 1
            }
            k -= 1
        }
        return ans
    }
}
