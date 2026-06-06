class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        var total = 0
        var n = nums.count

        for i in 0..<n {
            total += nums[i]//25
        }

        var leftSum = 0
        var rightSum = 0
        var ans = Array(repeating: 0, count: n)
        for i in 0..<n {
            rightSum = total - leftSum - nums[i]//15,25-10-4=11,25-14-8=3,25-22-3=0
            ans[i] = abs(leftSum - rightSum)//[15, 1, 11, 22]
            leftSum += nums[i]//10, 14, 22
        }
        return ans
    }
}
