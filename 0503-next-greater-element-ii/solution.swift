class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack:[Int] = []
        var n = nums.count
        var ans = Array(repeating:0, count: n)
        
        for i in stride(from: 2*n-1, through:0, by:-1) {
            let num = nums[i%n]
            while let last = stack.last, !stack.isEmpty && last <= num {
                stack.removeLast()
            }
            if i < n {
                ans[i] = stack.isEmpty ? -1 : stack.last!
            }
            stack.append(num)
        }
        return ans
    }
}
