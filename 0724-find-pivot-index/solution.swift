class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var n = nums.count
        var leftSum = Array(repeating: 0, count: n)
        var rightSum = Array(repeating: 0, count: n)

        leftSum[0] = nums[0]
        for i in 1..<nums.count {
            leftSum[i] = leftSum[i-1] + nums[i]
        }
        rightSum[n-1] = nums[n-1]
        for i in stride(from: n-2, through: 0, by: -1) {
            rightSum[i] = rightSum[i+1] + nums[i]
        }

        for i in 0..<nums.count {
            // print(leftSum[i] , rightSum[i])
            if leftSum[i] - nums[i] == rightSum[i] - nums[i] {
                return i
            }
        }

        return -1
    }
}
